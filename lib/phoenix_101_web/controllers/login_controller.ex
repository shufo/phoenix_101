defmodule Phoenix101Web.LogInController do
  use Phoenix101Web, :controller

  alias Phoenix101.Accounts
  alias Phoenix101.Accounts.User


  def index(conn, _params) do
    conn
    |> put_flash(:info, "Login")

  end

  def init(conn, _params) do
    conn
    |> put_flash(:info, "Login")

  end

  def create(conn, _params) do
    conn
    |> put_flash(:info, "Login")

  end

#----------------------------------------



end
