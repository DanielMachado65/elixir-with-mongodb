import Config

config :phx_mongo, PhxMongoWeb.Endpoint,
  http: [
    ip: {0, 0, 0, 0},
    port: String.to_integer(System.get_env("PORT", "4000"))
  ],
  code_reloader: true,
  check_origin: false,
  debug_errors: true,
  secret_key_base: String.duplicate("0", 64)
