defmodule PhxMongoWeb do
  def controller do
    quote do
      use Phoenix.Controller, namespace: PhxMongoWeb
      import Plug.Conn
      alias PhxMongoWeb.Router.Helpers, as: Routes
    end
  end

  def view do
    quote do
      use Phoenix.View, root: "lib/phx_mongo_web/templates", namespace: PhxMongoWeb
    end
  end

  def router do
    quote do
      use Phoenix.Router
      import Plug.Conn
    end
  end

  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
