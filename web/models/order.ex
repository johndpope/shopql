defmodule Shopql.Order do
  use Shopql.Web, :model

  schema "orders" do
    field :total, :decimal
    field :completed_at, Ecto.DateTime

    belongs_to :user, Shopql.User
    has_many :line_items, Shopql.LineItem
    many_to_many :products, Shopql.Product, join_through: Shopql.LineItem

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:total, :completed_at])
    |> validate_required([:total, :completed_at])
  end
end
