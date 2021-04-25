# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :blog_api, ecto_repos: [BlogApi.Repo]

# Configures the endpoint
config :blog_api, BlogApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "9ueg5YcX8/LKzVUcDrXp5xpYuaBCUfZZAJ3/udC1LCoabotR3O1CJyf/u/6RLJ/N",
  render_errors: [view: BlogApiWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: BlogApi.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :blog_api, BlogApiWeb.Guardian,
  issuer: "BlogApi",
  secret_key: "MDLMflIpKod5YCnkdiY7C4E3ki2rgcAAMwfBl0+vyC5uqJNgoibfQmAh7J3uZWVK",
  # optional
  allowed_algos: ["HS256"],
  ttl: {30, :days},
  allowed_drift: 2000,
  verify_issuer: true

# Configure bcrypt for passwords
config :comeonin, :bcrypt_log_rounds, 4

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
