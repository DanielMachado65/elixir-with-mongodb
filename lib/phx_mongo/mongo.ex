defmodule PhxMongo.Mongo do
  use GenServer

  def start_link(_opts) do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init(_) do
    url = Application.fetch_env!(:phx_mongo, __MODULE__)[:url]
    {:ok, conn} = Mongo.start_link(url: url, name: :mongo)
    {:ok, conn}
  end
end
