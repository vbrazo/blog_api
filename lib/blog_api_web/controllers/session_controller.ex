defmodule BlogApiWeb.SessionController do
  use BlogApiWeb, :controller

  alias BlogApi.Accounts.Auth

  action_fallback(BlogApiWeb.FallbackController)

  def create(conn, params) do
    case Auth.find_user_and_check_password(params) do
      {:ok, user} ->
        {:ok, jwt, _full_claims} =
          user |> BlogApiWeb.Guardian.encode_and_sign(%{}, token_type: :token)

        conn
        |> put_status(:created)
        |> render(BlogApiWeb.UserView, "login.json", jwt: jwt, user: user)

      {:error, message} ->
        conn
        |> put_status(401)
        |> render(BlogApiWeb.UserView, "error.json", message: message)
    end
  end

  def auth_error(conn, {_type, _reason}, _opts) do
    conn
    |> put_status(:forbidden)
    |> render(BlogApiWeb.UserView, "error.json", message: "Not Authenticated")
  end
end
