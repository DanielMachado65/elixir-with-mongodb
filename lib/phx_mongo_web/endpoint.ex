defmodule PhxMongoWeb.Endpoint do
  use Phoenix.Endpoint, otp_app: :phx_mongo

  socket("/socket", Phoenix.Socket)

  plug(Plug.RequestId)
  plug(Plug.Telemetry, event_prefix: [:phoenix, :endpoint])

  plug(Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Jason
  )

  plug(Plug.MethodOverride)
  plug(Plug.Head)

  plug(Plug.Session,
    store: :cookie,
    key: "_phx_mongo_key",
    signing_salt: "signsalt"
  )

  plug(PhxMongoWeb.Router)
end
