defmodule PhxMongoWeb.UserController do
  use PhxMongoWeb, :controller
  alias PhxMongo.Accounts

  def index(conn, _params) do
    users = Accounts.list_users()
    json(conn, users)
  end

  def create(conn, params) do
    case Accounts.create_user(params) do
      {:error, _} -> send_resp(conn, 400, "invalid")
      user -> conn |> put_status(:created) |> json(user)
    end
  end

  def show(conn, %{"id" => id}) do
    case Accounts.get_user(id) do
      nil -> send_resp(conn, 404, "not found")
      user -> json(conn, user)
    end
  end

  def update(conn, %{"id" => id} = params) do
    user = Accounts.update_user(id, Map.delete(params, "id"))
    json(conn, user)
  end

  def delete(conn, %{"id" => id}) do
    Accounts.delete_user(id)
    send_resp(conn, 204, "")
  end
end
