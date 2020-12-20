defmodule SempiternvsWeb.BoardController do
  use SempiternvsWeb, :controller
  alias Sempiternvs.Board

  def index(conn, %{"cod" => cod}) do

  	cod |> IO.inspect	

   json(conn , %{})


  end

  def boards(conn , _paramns), do: conn |> json(Board.all)

  def b(conn, _paranms), do: render(conn, "b.html",%{token:  get_csrf_token()})




end
