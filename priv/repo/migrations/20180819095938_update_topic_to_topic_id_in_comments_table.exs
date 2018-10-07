defmodule Discuss.Repo.Migrations.UpdateTopicToTopicIdInCommentsTable do
  use Ecto.Migration

  def change do
    rename table(:comments),  :topic, to: :topic_id
  end
end
