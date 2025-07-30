defmodule PhxMongoWeb.ErrorView do
  use PhxMongoWeb, :view

  def render("404.json", _assigns), do: %{error: "Not found"}
  def render("500.json", _assigns), do: %{error: "Internal server error"}
  def template_not_found(_, assigns), do: render("500.json", assigns)
end
