# defimpl Jason.Encoder, for: BSON.ObjectId do
#   def encode(id, options) do

#   	id 
#   	|> BSON.ObjectId.encode!
#   end
# end

defimpl Jason.Encoder, for: Mongo.Stream do
  def encode(value, options) do
    #
  	 value
  	 |> Map.get(:docs)
  	 |> Enum.map(&Map.update!(&1,"_id", fn x -> BSON.ObjectId.encode!(x) end ))
  	 |> Jason.Encoder.encode(options)
  	 #|> Map.update!(":_id", &BSON.ObjectId.encode!/1 )
  #	|> IO.inspect(label: "vsf kkk")
  	# |>  Jason.Encode.encode(options)
 	#	|> IO.inspect
 # 	|> BSON.ObjectId.encode!
  end
end