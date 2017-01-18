defmodule Shopql.Schema do
  use Absinthe.Schema

  import_types Shopql.Schema.Types
 
  query do

    @desc "Get all orders"
    field :orders, list_of(:order) do
      resolve &Shopql.OrderResolver.all/2
    end

    @desc "Get a specific order"
     field :order, type: :order do
       arg :id, non_null(:id)
       resolve &Shopql.OrderResolver.find/2
    end
 
    @desc "Get all products"
    field :products, list_of(:product) do
      resolve &Shopql.ProductResolver.all/2
    end

    @desc "Get all categories"
    field :categories, list_of(:category) do
      resolve &Shopql.CategoryResolver.all/2
    end

    @desc "Get all product categories"
    field :product_categories, list_of(:product_category) do
      resolve &Shopql.ProductCategoryResolver.all/2
    end

    @desc "Get all wishes"
    field :wishes, list_of(:wish) do
      resolve &Shopql.WishResolver.all/2
    end

    @desc "Get all users"
    field :users, list_of(:user) do
      resolve &Shopql.UserResolver.all/2
    end

    @desc "Get a specific user"
     field :user, type: :user do
       arg :id, non_null(:id)
       resolve &Shopql.UserResolver.find/2
    end
  end
end
