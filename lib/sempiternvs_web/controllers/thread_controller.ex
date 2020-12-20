defmodule SempiternvsWeb.ThreadController do

	use SempiternvsWeb, :controller
  alias Sempiternvs.Thread


  def create(conn , paramns) do
 		
  	Thread.create(paramns)

  	redirect(conn, to: "/#{paramns["board"]}")


  end

  # def reply(conn , %{"id" => id}) do 

  # 	id |> IO.inspect	
  # 	render(conn , "reply.html",%{id: id , token: get_csrf_token()})

  # end	
	
end