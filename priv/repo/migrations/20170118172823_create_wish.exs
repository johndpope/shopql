defmodule Shopql.Repo.Migrations.CreateWish do
  use Ecto.Migration

  def change do
    create table(:wishes) do
      add :user_id, references(:users, on_delete: :nothing)
      add :product_id, references(:products, on_delete: :nothing)

      timestamps()
    end
    create index(:wishes, [:user_id])
    create index(:wishes, [:product_id])

  end
end
