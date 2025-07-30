import Config

config :phx_mongo, PhxMongoWeb.Endpoint,
  url: [host: System.get_env("PHX_HOST", "example.com"), port: 80],
  cache_static_manifest: "priv/static/cache_manifest.json"

config :logger, level: :info
