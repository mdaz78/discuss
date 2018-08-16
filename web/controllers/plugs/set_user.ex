defmodule Discuss.Plugs.SetUser do
  @moduledoc false

  import Plug.Conn
  import Phoenix.Controller

  # aliases
  alias Discuss.Repo
  alias Discuss.User

  def init(_params) do
  end

  def call(conn, _params) do
    user_id = get_session(conn, :user_id)
    cond do
      user = user_id && Repo.get(User, user_id) ->
        assign(conn, :user, user) 
        # after this step conn.assigns.user will give us the user construct

      true ->
        assign(conn, :user, nil)
    end
  end
end