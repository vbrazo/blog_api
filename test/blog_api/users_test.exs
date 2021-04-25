defmodule BlogApi.Accounts.UsersTest do
  @moduledoc nil

  use BlogApi.DataCase

  alias BlogApi.Accounts.Users

  @user_create_attrs %{
    email: "some email",
    password: "some password",
    username: "some username",
    bio: "some bio",
    image: "some image"
  }

  test "update_user/2 hashes the password if new one set" do
    {:ok, user} = BlogApi.Accounts.Auth.register(@user_create_attrs)

    new_password = "newPassword!123"

    Users.update_user(user, %{password: new_password})

    assert BlogApi.Accounts.Auth.find_user_and_check_password(%{
             "user" => %{"email" => @user_create_attrs.email, "password" => new_password}
           })
  end
end
