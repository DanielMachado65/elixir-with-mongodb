defmodule PhxMongoWeb.SessionController do
  use PhxMongoWeb, :controller
  alias PhxMongo.Accounts

  def create(conn, %{"email" => email, "password" => pass}) do
    case Accounts.authenticate(email, pass) do
      {:ok, user} ->
        token = Phoenix.Token.sign(PhxMongoWeb.Endpoint, "user", user.id)
        json(conn, %{token: token, user: user})

      :error ->
        send_resp(conn, 401, "unauthorized")
    end
  end

  def delete(conn, _params) do
    send_resp(conn, 204, "")
  end
end
