defmodule ExunitexampleWeb.PageController do
  use ExunitexampleWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
