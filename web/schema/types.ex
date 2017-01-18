defmodule Shopql.Schema.Types do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: Shopql.Repo
 
  object :user do
    field :id, :id
    field :name, :string
    field :email, :string
    field :total, :float
    field :orders, list_of(:order), resolve: assoc(:orders)
  end

  object :order do
    field :id, :id
    field :total, :float
    field :user, :user, resolve: assoc(:user)
    field :items, list_of(:line_item), resolve: assoc(:line_items)
  end

  object :line_item do
    field :id, :id
    field :name, :string
    field :unit_price, :float
    field :quantity, :integer
    field :order, :order, resolve: assoc(:order)
    field :product, :product, resolve: assoc(:product)
  end
 
  object :product do
    field :id, :id
    field :name, :string
    field :price, :float
    field :line_items, list_of(:line_item), resolve: assoc(:line_items)
    field :product_categories, list_of(:product_category), resolve: assoc(:product_categories)
  end

  object :category do
    field :id, :id
    field :name, :string
    field :product_categories, list_of(:product_category), resolve: assoc(:product_categories)
  end

  object :product_category do
    field :id, :id
    field :category, :category, resolve: assoc(:category)
    field :product, :product, resolve: assoc(:product)
  end

  object :wish do
    field :id, :id
    field :user, :user, resolve: assoc(:user)
    field :product, :product, resolve: assoc(:product)
  end
end
