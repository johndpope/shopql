defmodule Shopql.CategoryResolver do
  alias Shopql.Repo
  alias Shopql.Category
 
  def all(_args, _info) do
    {:ok, Repo.all(Category)}
  end
end
