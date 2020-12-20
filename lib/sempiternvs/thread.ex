defmodule Sempiternvs.Thread do

	alias Sempiternvs.Thread


	def collections, do: :mongo |> Mongo.show_collections |> Enum.to_list

	def parser(map) do

		file_list = map["arquivos"]
									|> Enum.map(&Thread.move_file(&1,map["board"]))

		map 
		|> Map.drop(["_csrf_token", "board"])
		|> Map.update!("arquivos", fn  _x -> file_list end)
    |> Map.put_new("inserted_at", DateTime.utc_now |> DateTime.add(-10800))
    |> Map.put_new("updated_at", DateTime.utc_now |> DateTime.add(-10800))
    |> Map.put_new("bump_data", DateTime.utc_now |> DateTime.add(-10800))
    |> Map.put_new("author", "Anonymous")

	end	

	def create(thread) do
			
		doc = Thread.parser(thread)

		if thread["board"] in Thread.collections,do: 	Mongo.create(:mongo , thread["board"])

		Mongo.insert_one(:mongo, thread["board"], doc)

	end



  def move_file(file, location) do
    

    [_ , format ] = file.content_type |> String.split("/")
    filename = "#{Mongo.object_id |> BSON.ObjectId.encode!}.#{format}"
    if not File.exists?("priv/static/images/board/#{location}"), do: File.mkdir_p("priv/static/images/board/#{location}")
    File.cp(file.path, "priv/static/images/board/#{location}/#{filename}")
    filename
  end


  def all(board), do: :mongo |> Mongo.find(board, %{},sort:  %{bump_data: -1}) |> Map.get(:docs) 

  def by_id(id, board) when is_binary(id), do: id |> BSON.ObjectId.decode! |> Thread.by_id(board)

  def by_id(id,board), do: Mongo.find_one(:mongo , board , %{_id: id})

end
