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
    changeset = User.changeset(%User{}, user_params)
    signin(conn, changeset)
  end


  defp signin(conn, changeset) do
    case insert_or_update_user(changeset) do
      { :ok, user } ->
        # update session or cookies if logged in successfully
        conn
        |> put_flash(:info, "Welcome Back!")
        |> put_session(:user_id, user.id)
        |> redirect(to: topic_path(conn, :index))

      { :error, _reason } ->
        conn
        |> put_flash(:error, "Error Sign In")
        |> redirect(to: topic_path(conn, :index))
    end
  end

  # function to check if the user is already present in the DB or not
  defp insert_or_update_user(changeset) do
    case Repo.get_by(User, email: changeset.changes.email) do
      nil -> 
        Repo.insert(changeset)

      user ->
        { :ok, user } 
    end
  end
end