import Config

if config_env() == :prod do
  config :phx_mongo, PhxMongoWeb.Endpoint,
    http: [ip: {0, 0, 0, 0}, port: String.to_integer(System.get_env("PORT") || "4000")],
    secret_key_base: System.fetch_env!("SECRET_KEY_BASE")

  config :phx_mongo, PhxMongo.Mongo,
    url: System.get_env("MONGODB_URL") || "mongodb://mongo:27017/phx_mongo"
else
  config :phx_mongo, PhxMongo.Mongo,
    url: System.get_env("MONGODB_URL") || "mongodb://mongo:27017/phx_mongo"
end
