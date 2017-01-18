defmodule Shopql.Product do
  use Shopql.Web, :model

  schema "products" do
    field :name, :string
    field :price, :decimal

    has_many :line_items, Shopql.LineItem
    has_many :product_categories, Shopql.ProductCategory
    many_to_many :orders, Shopql.Order, join_through: Shopql.LineItem
    many_to_many :categories, Shopql.Category, join_through: Shopql.ProductCategory
    many_to_many :wishful_users, Shopql.User, join_through: Shopql.Wish

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :price])
    |> validate_required([:name, :price])
  end
end
