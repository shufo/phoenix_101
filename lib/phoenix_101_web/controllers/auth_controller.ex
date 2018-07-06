defmodule Phoenix101Web.AuthController do
  use Phoenix101Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
