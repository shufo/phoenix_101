defmodule Phoenix101Web.UserController do
  use Phoenix101Web, :controller

  alias Phoenix101.Accounts
  alias Phoenix101.Accounts.User
  alias Phoenix101.Repo

  def index(conn, _params) do
      users = Repo.all(User)
      render conn, "index.html", users: users
  end


  def new(conn, _params) do
      changeset = User.changeset(%User{})
      render conn, "new.html", changeset: changeset
  end


  def create(conn, %{"user" => user_params}) do
      changeset = User.changeset(%User{}, user_params)
        case Repo.insert(changeset) do
          {:ok, user} ->
            conn
            |> put_flash(:info, "#作成しました")
            |> redirect(to: user_path(conn, :show, user.id ))

          {:error, changeset} ->
             render(conn, "new.html", changeset: changeset)
        end
  end


  def show(conn, %{"id" => id}) do
      user = Repo.get(User, id)
      render conn, "show.html", user: user
  end


  def edit(conn, %{"id" => id}) do
      user = Repo.get(User, id)
      changeset = User.changeset(user)
      render(conn, "edit.html", user: user, changeset: changeset)
  end


  def update(conn, %{"id" => id, "user" => user_params}) do
      user = Repo.get(User, id)
        changeset = User.changeset(user, user_params)

        case Repo.update(changeset) do
          {:ok, user} ->
            conn
            |> put_flash(:info, "更新しました")
            |> redirect(to: user_path(conn, :show, user.id))
          {:error, changeset} ->
            render(conn, "edit.html", user: user, changeset: changeset)
        end
  end



  def delete(conn, %{"id" => id}) do
  user = Repo.get(User, id)
    Repo.delete(user)

    conn
    |> put_flash(:info, "削除しました")
    |> redirect(to: user_path(conn, :index))
  end

end
