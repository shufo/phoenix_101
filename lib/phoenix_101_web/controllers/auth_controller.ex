defmodule Phoenix101Web.AuthController do
  use Phoenix101Web, :controller

  #@create_attrs %{password: "some password", username: "some username"}
  #@input_attrs %{password: "some password", username: "some username"}
  #@invalid_attrs %{password: nil, username: nil}

  def index(conn, _params) do
    render conn, "index.html"
  end

  def create(conn, %{"user" => user_params}) do
      # ログイン可否を判定する
      case Phoenix101.Auth.login(user_params, Phoenix101.Repo) do
        # ログイン成功の場合、セッションにuser.idを設定し、ホーム("/")にリダイレクトする
        {:ok, user} ->
          conn
          |> put_session(:current_user, user.id) #?
          |> put_flash(:info, "ログインしました")
          |> redirect(to: "/pages/index")
        # errorの場合、ログイン画面を再表示する
        :error ->
          conn
          |> put_flash(:info, "メールアドレスかパスワードが間違っています")
          |> render("login.html")
      end
    end

end
