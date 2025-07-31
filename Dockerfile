FROM elixir:1.15-alpine AS build
ENV MIX_ENV=prod
WORKDIR /app

RUN apk add --no-cache build-base git

RUN mix local.hex --force && mix local.rebar --force

COPY mix.exs mix.lock ./
COPY config config
RUN mix deps.get --only $MIX_ENV
COPY . .
RUN mix deps.compile && mix compile

FROM elixir:1.15-alpine
ENV MIX_ENV=prod
WORKDIR /app

RUN mix local.hex --force && mix local.rebar --force

COPY --from=build /app ./
CMD ["elixir", "--erl", "+K true", "-S", "mix", "phx.server"]
