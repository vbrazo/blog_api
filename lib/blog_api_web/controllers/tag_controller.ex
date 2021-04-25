defmodule BlogApiWeb.TagController do
  use BlogApiWeb, :controller

  alias BlogApi.Blog

  action_fallback(BlogApiWeb.FallbackController)

  def index(conn, _params) do
    render(conn, "index.json", tags: Blog.list_tags())
  end
end
