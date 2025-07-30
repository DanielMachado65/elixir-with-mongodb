defmodule PhxMongo.Accounts.User do
  @derive {Jason.Encoder, only: [:id, :name, :email, :inserted_at, :updated_at]}
  defstruct [:id, :name, :email, :password_hash, :inserted_at, :updated_at]
end
