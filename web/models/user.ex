defmodule Shopql.User do
  use Shopql.Web, :model

  schema "users" do
    field :name, :string
    field :email, :string

    has_many :orders, Shopql.Order
    many_to_many :wished_for_products, Shopql.Product, join_through: Shopql.Wish

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :email])
    |> validate_required([:name, :email])
  end
end
