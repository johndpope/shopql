defmodule Shopql.ProductCategory do
  use Shopql.Web, :model

  schema "products_categories" do
    belongs_to :product, Shopql.Product
    belongs_to :category, Shopql.Category

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [])
    |> validate_required([])
  end
end
