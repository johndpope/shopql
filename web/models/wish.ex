defmodule Shopql.Wish do
  use Shopql.Web, :model

  schema "wishes" do
    belongs_to :user, Shopql.User
    belongs_to :product, Shopql.Product

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
