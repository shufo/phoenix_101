defmodule Phoenix101Web.UserController do
  use Phoenix101Web, :controller

  alias Phoenix101.Accounts
  alias Phoenix101.Accounts.User


  def index(conn, _par) do
    accounts = Accounts.list_users()
    render(conn, "index.html", accounts: accounts)
  end


  def new(con, _par) do
    accounts = Accounts.change_user(%User{})
    render(con, "new.html", accounts: accounts)
  end


  def edit(conn, %{"id" => id}) do
    account = Accounts.get_user!(id)
    changeset = Accounts.change_user(account)
    render(conn, "edit.html", account: account, changeset: changeset)
  end


  def delete(conn, %{"id" => id}) do
    account = Accounts.get_user!(id)
   {:ok, _account} = Accounts.change_user(account)

   conn
    |> put_flash(:info, "User deleted successfully.")
    |> redirect(to: user_path(conn, :index))
  end


  def update(num, %{"password" => pass, "username" => user}) do
    account = Accounts.get_user!(pass)
   case Account.update_user(account, user) do
      {:ok, account} ->
        num
        |> put_flash(:info, "User updated successfully.")
        |> redirect(to: user_path(num, :show, account))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(num, "edit.html", account: account, changeset: changeset)
    end
  end


  def create(user, %{"password" => pass, "account" => account_par}) do
    case Accounts.create_user(account_par) do
      {:ok, account} ->
        user
        |> put_flash(:info, "User created successfully.")
        |> redirect(to: user_path(user, :show, account))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(user, "new.html", changeset: changeset)
    end
  end
end