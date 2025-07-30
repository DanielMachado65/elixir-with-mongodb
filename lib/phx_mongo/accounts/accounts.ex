defmodule PhxMongo.Accounts do
  alias PhxMongo.Accounts.User

  @coll "users"

  def list_users do
    Mongo.find(:mongo, @coll, %{})
    |> Enum.map(&bson_to_user/1)
  end

  def get_user(id) do
    case Mongo.find_one(:mongo, @coll, %{_id: to_object_id(id)}) do
      nil -> nil
      doc -> bson_to_user(doc)
    end
  end

  def create_user(attrs) do
    now = DateTime.utc_now() |> DateTime.truncate(:second)

    user = %{
      name: attrs["name"],
      email: attrs["email"],
      password_hash: Bcrypt.hash_pwd_salt(attrs["password"]),
      inserted_at: now,
      updated_at: now
    }

    {:ok, %{"inserted_id" => id}} = Mongo.insert_one(:mongo, @coll, user)
    get_user(id)
  end

  def update_user(id, attrs) do
    updates =
      Enum.into(attrs, %{}, fn {k, v} -> {String.to_atom(k), v} end)
      |> Map.put(:updated_at, DateTime.utc_now() |> DateTime.truncate(:second))

    Mongo.update_one(:mongo, @coll, %{_id: to_object_id(id)}, %{"$set" => updates})
    get_user(id)
  end

  def delete_user(id) do
    Mongo.delete_one(:mongo, @coll, %{_id: to_object_id(id)})
    :ok
  end

  def authenticate(email, password) do
    case Mongo.find_one(:mongo, @coll, %{email: email}) do
      nil ->
        :error

      doc ->
        user = bson_to_user(doc)

        if Bcrypt.verify_pass(password, user.password_hash) do
          {:ok, user}
        else
          :error
        end
    end
  end

  defp bson_to_user(doc) do
    %User{
      id: doc["_id"] |> BSON.ObjectId.encode!(),
      name: doc["name"],
      email: doc["email"],
      password_hash: doc["password_hash"],
      inserted_at: doc["inserted_at"],
      updated_at: doc["updated_at"]
    }
  end

  defp to_object_id(id) when is_binary(id), do: BSON.ObjectId.decode!(id)
  defp to_object_id(%BSON.ObjectId{} = id), do: id
end
