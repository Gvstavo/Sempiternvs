defmodule Sempiternvs.Reply do

	
	alias Sempiternvs.Reply
	alias Sempiternvs.Thread

	def parser(reply) when not is_map_key(reply , "arquivos"), do:
		reply
		|> Map.drop(["_csrf_token"])
		|> Map.update!("thread_id", &BSON.ObjectId.decode!/1)
		|> Map.put_new("inserted_at", DateTime.utc_now |> DateTime.add(-10800))
    |> Map.put_new("updated_at", DateTime.utc_now |> DateTime.add(-10800))
    |> Map.put_new("arquivos",[])
    |> Map.put_new("author", "Anonymous")


	def parser(reply) , do:
		reply
		|> Map.drop(["_csrf_token"])
		|> Map.update!("thread_id", &BSON.ObjectId.decode!/1)
		|> Map.put_new("inserted_at", DateTime.utc_now |> DateTime.add(-10800))
    |> Map.put_new("updated_at", DateTime.utc_now |> DateTime.add(-10800))
    |> Map.put_new("author", "Anonymous")

   

	def create(reply) do
			
		doc = reply 
						 |> Reply.parser 


	end	
	
end