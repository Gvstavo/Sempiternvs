defmodule SempiternvsWeb.PageController do
  use SempiternvsWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
