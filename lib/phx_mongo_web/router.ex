defmodule PhxMongoWeb.Router do
  use Phoenix.Router

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/api", PhxMongoWeb do
    pipe_through(:api)

    post("/login", SessionController, :create)
    delete("/logout", SessionController, :delete)

    resources("/users", UserController, except: [:new, :edit])
  end
end
