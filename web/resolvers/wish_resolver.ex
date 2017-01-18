defmodule Shopql.WishResolver do
  alias Shopql.Repo
  alias Shopql.Wish
 
  def all(_args, _info) do
    {:ok, Repo.all(Wish)}
  end
end
