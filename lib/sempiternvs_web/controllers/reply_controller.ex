defmodule SempiternvsWeb.ReplyController do
	use SempiternvsWeb, :controller
  alias Sempiternvs.Reply
  alias Sempiternvs.Thread


  def index(conn , %{"id" => id, "board" => board}) do 

  	#d |> IO.inspect	
  	render(conn , "index.html",%{id: id , token: get_csrf_token(), thread: Thread.by_id(id,board)})

  end	
	
  def create(conn , paramns) do

    paramns |> IO.inspect(label: "create reply controller")
    
    send_resp(conn , 200 , "oui")
  end
end