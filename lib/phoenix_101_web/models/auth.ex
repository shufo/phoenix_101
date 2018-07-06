defmodule Phoenix101.Auth do
  alias Phoenix101.User

  #def login(conn, %{"user" => user_params}) do

  #  login_usr = Repo.get_by(username: user_params.username, password: user_params.password)
  #  if login_usr do
  #    session = login_usr
  #    render "auth/login"
  #  else
  #    render "users/index"
  #  end
  #end


  def login(params, repo) do
    user = repo.get_by(User, username: String.downcase(params["username"]))
    case authenticate(user, params["password"]) do
      true -> {:ok, user}
      _    -> :error
    end
  end

  defp authenticate(user, password) do
    case user do
      nil -> false
      _   -> Comeonin.Bcrypt.checkpw(password, user.crypted_password)
    end
  end
end
