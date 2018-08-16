defmodule Discuss.Plugs.RequireAuth do
  @moduledoc """
  Module plug to authorize user to perform specific
  tasks
  """
  
  # imports
  import Phoenix.Controller
  import Plug.Conn

  # aliases
  alias Discuss.Router.Helpers
  
  @doc false
  def init(_params) do
  end

  @doc false
  def call(conn, _params) do
    if conn.assigns[:user] do
      conn
    else
      conn
      |> put_flash(:error, "You must be logged in!")
      |> redirect(to: Helpers.topic_path(conn, :index))
      |> halt()
    end
  end
end