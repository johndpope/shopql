defmodule Shopql.LineItem do
  use Shopql.Web, :model

  schema "line_items" do
    field :name, :string
    field :unit_price, :decimal
    field :quantity, :integer
    belongs_to :order, Shopql.Order
    belongs_to :product, Shopql.Product

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :unit_price, :quantity])
    |> validate_required([:name, :unit_price, :quantity])
  end
end
