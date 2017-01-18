defmodule Shopql.Category do
  use Shopql.Web, :model

  schema "categories" do
    field :name, :string

    has_many :product_categories, Shopql.ProductCategory
    many_to_many :products, Shopql.Product, join_through: Shopql.ProductCategory

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name])
    |> validate_required([:name])
  end
end
