defmodule Phoenix101Web.UserView do
  use Phoenix101Web, :view

  def template_not_found(_template, _assigns) do
    Phoenix.Controller.status_message_from_template("New User / 新規ユーザ")
  end
end
