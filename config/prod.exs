use Mix.Config

config :blog_api, BlogApiWeb.Endpoint,
  load_from_system_env: true,
  http: [port: {:system, "PORT"}],
  url: [scheme: "https", host: "https://blog_api.herokuapp.com/", port: 443],
  force_ssl: [rewrite_on: [:x_forwarded_proto]],
  secret_key_base: Map.fetch!(System.get_env(), "SECRET_KEY_BASE")

config :logger, level: :info

config :blog_api, BlogApi.Repo,
  adapter: Ecto.Adapters.Postgres,
  url: System.get_env("DATABASE_URL"),
  pool_size: String.to_integer(System.get_env("POOL_SIZE") || "10"),
  ssl: true
