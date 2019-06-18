defmodule Countdown.Repo.Migrations.AddUsers do
  use Ecto.Migration

  def change do
    create table(:users, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :auth0_id, :string
      add :email, :string

      add :role, :string

      timestamps()
    end

    create index(:users, [:email], unique: true)
    create index(:users, [:auth0_id], unique: true)
  end
end
