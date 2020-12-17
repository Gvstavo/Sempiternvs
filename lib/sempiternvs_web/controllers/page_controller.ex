defmodule SempiternvsWeb.PageController do
  use SempiternvsWeb, :controller

  def index(conn, _params) do

  	token = get_csrf_token()
    render(conn, "index.html", %{token: token})
  end
end
