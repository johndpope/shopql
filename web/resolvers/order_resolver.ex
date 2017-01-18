defmodule Shopql.OrderResolver do
  alias Shopql.Repo
  alias Shopql.Order
 
  def all(_args, _info) do
    {:ok, Repo.all(Order)}
  end

  def find(%{id: id}, _info) do
    case Shopql.Repo.get(Order, id) do
      nil  -> {:error, "Order id #{id} not found"}
      order -> {:ok, order}
    end
  end
end
