defmodule Discuss.TopicController do
  use Discuss.Web, :controller

  # aliases
  alias Discuss.Topic

  def new(conn, params) do
    changeset = Topic.changest(%Topic{}, %{})
  end
end