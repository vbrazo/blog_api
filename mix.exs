defmodule BlogApi.Mixfile do
  use Mix.Project

  def project do
    [
      app: :blog_api,
      version: "1.0.0",
      elixir: "~> 1.9",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:phoenix, :gettext] ++ Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps(),
      test_coverage: [tool: ExCoveralls],

      # Docs
      name: "BlogApi",
      source_url: "https://github.com/vbrazo/blog_api",
      homepage_url: "https://github.com/vbrazo/blog_api",
      # The main page in the docs
      docs: [main: "README", extras: ["README.md"]]
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [mod: {BlogApi.Application, []}, extra_applications: [:logger, :runtime_tools, :comeonin]]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support", "test/factories"]
  defp elixirc_paths(_), do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:phoenix, "~> 1.6.2"},
      {:phoenix_pubsub, "~> 2.0"},
      {:phoenix_ecto, "~> 3.2"},
      {:postgrex, "~> 0.13.3"},
      {:poison, "~> 3.1.0"},
      {:gettext, "~> 0.11"},
      {:proper_case, "~> 1.0.0"},
      {:cowboy, "~> 2.7"},
      {:plug_cowboy, "~> 2.2"},
      {:comeonin, "~> 3.2"},
      {:guardian, "~> 1.0"},
      {:excoveralls, "~> 0.7", only: [:dev, :test]},
      {:credo, "~> 0.8.5", only: [:dev, :test]},
      {:ex_machina, "~> 2.0", only: :test},
      {:ex_doc, "~> 0.16", only: :dev, runtime: false},
      {:faker, "~> 0.16", only: [:test, :dev]},
      {:plug, "~> 1.0"},
      {:corsica, "~> 1.0"}
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to create, migrate and run the seeds file at once:
  #
  #     $ mix ecto.setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [
      "ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
      "ecto.reset": ["ecto.drop", "ecto.setup"],
      test: ["ecto.create --quiet", "ecto.migrate", "test"]
    ]
  end
end
