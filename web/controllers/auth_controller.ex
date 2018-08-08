defmodule Discuss.AuthController do
  use Discuss.Web, :controller
  plug Ueberauth

  alias Discuss.User

  def callback(conn, params) do
    auth = conn.assigns.ueberauth_auth
    %{"provider" => provider} = params
    user_params = %{
      token: auth.credentials.token,
      email: auth.info.email,
      provider: provider
    }
  end
end