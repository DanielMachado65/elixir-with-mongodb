defmodule PhxMongo.Application do
  use Application

  def start(_type, _args) do
    children = [
      {Phoenix.PubSub, name: PhxMongo.PubSub},
      PhxMongo.Mongo,
      PhxMongoWeb.Endpoint
    ]

    opts = [strategy: :one_for_one, name: PhxMongo.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def config_change(changed, _new, removed) do
    PhxMongoWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
