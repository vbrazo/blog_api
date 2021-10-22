FROM elixir

WORKDIR /app

RUN mix local.hex --force && \
  mix local.rebar --force

COPY . .

RUN mix deps.get

EXPOSE 4000

CMD ["mix", "phx.server"]
