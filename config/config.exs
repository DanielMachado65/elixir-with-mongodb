import Config

config :phx_mongo, PhxMongoWeb.Endpoint,
  url: [host: System.get_env("PHX_HOST", "localhost"), port: 80],
  render_errors: [view: PhxMongoWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: PhxMongo.PubSub,
  live_view: [signing_salt: "SALTSALT"]

config :phoenix, :json_library, Jason
import_config "#{config_env()}.exs"
