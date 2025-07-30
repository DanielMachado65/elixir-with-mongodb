import Config

config :phx_mongo, PhxMongoWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: String.duplicate("0", 64)
