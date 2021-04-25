defmodule BlogApiWeb.TagControllerTest do
  use BlogApiWeb.ConnCase
  import BlogApi.Factory

  setup do
    user = insert(:user)
    insert(:article, author: user)
    :ok
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get(conn, tag_path(conn, :index))
    assert json_response(conn, 200)["tags"] == ["tag1", "tag2"]
  end
end
