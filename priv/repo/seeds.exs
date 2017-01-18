# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Shopql.Repo.insert!(%Shopql.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

# mix ecto.reset

import Ecto.Query

alias Shopql.Repo
alias Shopql.User
alias Shopql.Product
alias Shopql.Order
alias Shopql.LineItem
alias Shopql.Wish
alias Shopql.Category
alias Shopql.ProductCategory

Enum.each(1..10, fn(_) ->
  Repo.insert! %User{ name: Faker.Name.name, email: Faker.Internet.email  }
end)

users = Repo.all(User)

Repo.insert! %Category{ name: "Electronics & Computers"  }
Repo.insert! %Category{ name: "Sports & Outdoors"  }
Repo.insert! %Category{ name: "Home, Garden & Tools"  }
Repo.insert! %Category{ name: "Movies, Music & Games"  }
Repo.insert! %Category{ name: "Clothing, Shoes & Jewelery"  }

categories = Repo.all(Category)

Enum.each(1..100, fn(_) ->
  product = Repo.insert! %Product{ name: Faker.Commerce.product_name, 
                                   price: Faker.Commerce.price  }

  category = categories |> Enum.take_random(1) |> hd

  Repo.insert! %ProductCategory{ product_id: product.id, 
                                 category_id: category.id  }
end)

products = Repo.all(Product)

Enum.each(users, fn(user) ->
  products = products |> Enum.take_random(3)

  Enum.each(products, fn(product) ->
    Repo.insert! %Wish{ user_id: user.id, product_id: product.id  }
  end)          
end)

Enum.each(1..50, fn(_) ->
  product = products |> Enum.take_random(1) |> hd
  user = users |> Enum.take_random(1) |> hd

  order = Repo.insert! %Order{ total: product.price,
                               completed_at: Ecto.DateTime.utc,
                               user_id: user.id }

  Repo.insert! %LineItem{
    name: product.name, 
    unit_price: product.price, 
    quantity: 1,
    order_id: order.id,
    product_id: product.id
  }
end)

