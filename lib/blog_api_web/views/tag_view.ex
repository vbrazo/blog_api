defmodule BlogApiWeb.TagView do
  use BlogApiWeb, :view

  def render("index.json", %{tags: tags}) do
    %{tags: tags}
  end
end
