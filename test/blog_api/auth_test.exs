defmodule BlogApi.Accounts.AuthTest do
  @moduledoc false
  use BlogApi.DataCase

  alias BlogApi.Accounts.Auth

  @user_create_attrs %{
    email: "some email",
    password: "some password",
    username: "some username",
    bio: "some bio",
    image: "some image"
  }

  describe "given valid parameters" do
    test "register/1 creates a user" do
      Auth.register(@user_create_attrs)
    end
  end

  describe "given invalid parameters" do
    test "register/1 does not create a user" do
      Auth.register(%{})
      assert {:error, _} = Auth.register(%{})
    end

    test "register/1 returns error if email is used already" do
      Auth.register(@user_create_attrs)
      assert {:error, _} = Auth.register(@user_create_attrs)
    end
  end
end
