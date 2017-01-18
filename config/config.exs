# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :shopql,
  ecto_repos: [Shopql.Repo]

# Configures the endpoint
config :shopql, Shopql.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "JZhz6jNTvQwxy9kQwX59CqgH7ehm3DFR5o9PbEgYLIiCQBGc2Vt1UOFqT9dSj8cz",
  render_errors: [view: Shopql.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Shopql.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
