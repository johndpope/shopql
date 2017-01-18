defmodule Shopql.ProductCategoryResolver do
  alias Shopql.Repo
  alias Shopql.ProductCategory
 
  def all(_args, _info) do
    {:ok, Repo.all(ProductCategory)}
  end
end
