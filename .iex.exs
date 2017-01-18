alias Shopql.{Repo, Order, User, Product, Wish, LineItem, Category, Queries}

import Ecto.Query

q = fn -> c("lib/shopql/queries.exs") end
