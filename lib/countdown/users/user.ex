defmodule Countdown.User do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "users" do
    field(:auth0_id, :string)
    field(:email, :string)
    field(:role, :string, default: "view-only")

    timestamps()
  end

  def update_role_changeset(user, role) do
    user
    |> cast(%{role: role}, [:role])
  end

  def registration_changeset(user, attrs) do
    user
    |> cast(attrs, [:auth0_id, :email, :role])
    |> unique_constraint(:auth0_id, unique: :unique_auth0_id)
    |> unique_constraint(:email, unique: :unique_email)
    |> validate_required([:auth0_id])
    |> validate_required([:email])
    |> validate_format(:email, ~r/\S+@\S+\.\S+/)
  end
end
