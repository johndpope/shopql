defmodule Shopql.Repo.Migrations.CreateOrder do
  use Ecto.Migration

  def change do
    create table(:orders) do
      add :total, :decimal
      add :completed_at, :datetime
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end
    create index(:orders, [:user_id])

  end
end
