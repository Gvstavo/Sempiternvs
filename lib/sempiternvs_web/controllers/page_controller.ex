defmodule SempiternvsWeb.PageController do
  use SempiternvsWeb, :controller
  alias Sempiternvs.Board

  def index(conn, _params) do

  	token = get_csrf_token()
    render(conn, "index.html", %{token: token})
  end

  def boards(conn , _paramns), do:  conn |> json(Board.all)
end
