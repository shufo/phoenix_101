defmodule Phoenix101.User do
  use Ecto.Schema
  import Ecto.Changeset

  @timestamps_opts [usec: false]

  schema "users" do
    field :username, :string
    field :password, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:username, :password])
    |> validate_required([:username, :password])
  end
end
