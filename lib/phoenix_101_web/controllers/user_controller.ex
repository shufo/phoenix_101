defmodule Phoenix101Web.UserController do
  use Phoenix101Web, :controller

  alias Phoenix101.Accounts
  alias Phoenix101.Accounts.User

  def create(conn, _params) do
    render conn, "show.html"
  end

#----------------------------------------

  def new(conn, _params) do
    render conn, "new.html"
  end

#----------------------------------------

  def edit(conn, _params) do
    render conn, "edit.html"
  end

#----------------------------------------

  def index(conn, _params) do
    posts = Accounts.list_users()
    render(conn, "index.html", posts: posts)
   end

#----------------------------------------

  def update(conn, %{"id" => id, "post" => post_params,}) do
    render conn, "edit.html"
  end

#----------------------------------------

  def delete(conn, _params) do
    render conn, "new.html"
  end



end
