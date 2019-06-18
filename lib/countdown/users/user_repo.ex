defmodule Countdown.UserRepo do
  import Ecto.Query, warn: false
  alias Countdown.{User, Repo}

  def register_user(attrs) do
    auth0_id = attrs[:auth0_id]

    case get_user_by_auth0_id(auth0_id) do
      nil ->
        {:ok, new_user} =
          %User{}
          |> User.registration_changeset(attrs)
          |> Repo.insert()

        {:ok, new_user, "user registered"}

      existing_user ->
        {:ok, existing_user, "user already registered"}
    end
  end

  def update_user_role(%User{} = user, role) do
    user
    |> User.update_role_changeset(role)
    |> Repo.update()
  end

  def list_users do
    user_query = from(u in User)

    user_query
    |> Repo.all()
  end

  def get_user!(id) do
    User
    |> Repo.get!(id)
  end

  def get_user_by_auth0_id(auth0_id) do
    User
    |> Repo.get_by(auth0_id: auth0_id)
  end
end
