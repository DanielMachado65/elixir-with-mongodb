FROM elixir:1.15-alpine AS build
WORKDIR /app
ENV MIX_ENV=prod
COPY mix.exs mix.lock* ./
COPY config config
RUN mix deps.get --only prod
COPY . .
RUN mix deps.compile && mix compile

FROM elixir:1.15-alpine
WORKDIR /app
ENV MIX_ENV=prod
COPY --from=build /app .
CMD ["elixir", "--erl", "+K true", "-S", "mix", "phx.server"]
