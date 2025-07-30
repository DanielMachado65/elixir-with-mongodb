defmodule PhxMongo.MixProject do
  use Mix.Project

  def project do
    [
      app: :phx_mongo,
      version: "0.1.0",
      elixir: "~> 1.15",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  def application do
    [
      mod: {PhxMongo.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  defp deps do
    [
      {:phoenix, "~> 1.7"},
      {:phoenix_pubsub, "~> 2.1"},
      {:plug_cowboy, "~> 2.6"},
      {:jason, "~> 1.4"},
      {:mongodb_driver, "~> 0.9"},
      {:bcrypt_elixir, "~> 3.0"}
    ]
  end
end
