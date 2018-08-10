defmodule Discuss.Plugs.SetUser do
  @moduledoc false

  import Plug.Conn
  import Phoenix.Controller

  # aliases
  alias Discuss.Repo
  alias Discuss.User
  alias Discuss.Router.Helpers

  def init(_params) do
  end

  def call(conn, _params) do
  end
end