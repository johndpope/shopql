defmodule Shopql.Queries do
  alias Shopql.Repo
  alias Shopql.Order

  import Ecto.Query

  def all_orders do
    Repo.all(
      from order in Order
    ) |> IO.inspect
  end
  
end
