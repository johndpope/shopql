# Shopql

A simple example for learning GraphQL using Absinthe and Elixir/Phoenix.

## Running

  * Install dependencies with `mix deps.get`
  * Create, migrate, and seed your database with `mix ecto.setup`
  * Start the Phoenix endpoint with `mix phoenix.server`

Then visit [`localhost:4000/graphiql`](localhost:4000/graphiql) to send queries using the GraphiQL data explorer.

## Example Queries

```graphql
{
  users {
    name
    orders {
      total
      items {
        name
        unitPrice
        quantity
      }
    }
  }
}
```

```graphql
{
  user(id: "1") {
    name
    orders {
      total
      items {
        name
        unitPrice
        quantity
      }
    }
  }
}
```

```graphql
{
  orders {
    total,
    items {
      name,
      quantity,
      unit_price
    }
    user {
      name
      email
    }
  }
}
```

```graphql
{
  categories {
    name
    productCategories {
      product {
        name
        price
      }
    }
  }
}
```

```graphql
{
  wishes {
    user {
      name
    }
    product {
      name
    }
  }
}
```

## Learn more

  * Official Absinthe site: http://absinthe-graphql.org
  * "Learning GraphQL": http://absinthe-graphql.org/learning-graphql/
 
