defmodule Shopql.ProductResolver do
  alias Shopql.Repo
  alias Shopql.Product
 
  def all(_args, _info) do
    {:ok, Repo.all(Product)}
  end
end
