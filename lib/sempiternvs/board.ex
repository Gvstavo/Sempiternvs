defmodule Sempiternvs.Board do
	alias Sempiternvs.Board
	#require Protocol
	#Protocol.derive(Jason.Encoder, Mongo.Stream)
	#@derive Jason.Encoder
	@derive Poison.Encoder
	defp boards do
		[
			%{nome: "Random", cod: "b"},
			%{nome: "Moderação", cod: "mod"},
			%{nome: "Política", cod: "pol"},
			%{nome: "Tecnologia", cod: "enter"},
			%{nome: "jogos", cod: "N64"},
			%{nome: "Musica & projetos musicais", cod: "mu"},
			%{nome: "Animes e niponismo", cod: "a"},
			%{nome: "Estudos e literatura", cod: "sala"},
			%{nome: "Finanças", cod: "$"},
			%{nome: "Desenvolvimento pessoal", cod: "build"},
			%{nome: "Artes", cod: "art"}
		]

	end	

	def create, do: 
		:mongo
		|> Mongo.insert_many("boards" , boards)

	def all, do: 
		:mongo 
		|> Mongo.find("boards",%{})
		#|> Map.get(:docs) 
		
	#	|> Map.new
	#|> IO.inspect
		#|> Enum.map(&Map.update!(&1 , "_id", fn x -> BSON.ObjectId.encode!(x)  end))



end