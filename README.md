# Blog API in Phoenix

This codebase was created to demonstrate a fully fledged backend API with **Elixir and Phoenix** including CRUD operations, authentication, routing, pagination, and more.

We've gone to great lengths to adhere to the **[credo](https://github.com/rrrene/credo)** community style guides & best practices.

- [Blog API in Phoenix](#blog-api-in-phoenix)
  - [Installation](#installation)
  - [Tests](#tests)
  - [Documentation](#documentation)
  - [Style guide](#style-guide)
  - [Licensing](#licensing)

## Installation

To run this project, you will need to install the following dependencies on your system:

* [Elixir](https://elixir-lang.org/install.html)
* [Phoenix](https://hexdocs.pm/phoenix/installation.html)
* [PostgreSQL](https://www.postgresql.org/download/macosx/)

To get started, run the following commands in your project folder:

| Command                                       | Description                                  |
|-----------------------------------------------|----------------------------------------------|
| `cp config/dev.exs.example config/dev.exs`    | creates the project's configuration file     |
| `mix deps.get`                                | installs the dependencies                    |
| `mix ecto.create`                             | creates the database                         |
| `mix ecto.migrate`                            | run the database migrations                  |
| `mix phx.server`                              | run the application                          |

This is a backend project, you won't be able to go to `localhost:4000` and see an application.

## Tests

To run the tests for this project, simply run in your terminal:

```shell
mix test
```

## Documentation

To generate the documentation, your can run in your terminal:

```shell
mix docs
```

This will generate a `doc/` directory with a documentation in HTML. To view the documentation, open the `index.html` file in the generated directory.

## Style guide

This project uses [mix format](https://hexdocs.pm/mix/master/Mix.Tasks.Format.html). You can find the configuration file for the formatter in the `.formatter.exs` file.

## Licensing

MIT © Vitor Oliveira
