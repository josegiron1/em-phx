defmodule EventMonitoring.Repo.Migrations.RemoveProjectIdFromKeys do
  use Ecto.Migration

  def change do
    alter table(:keys) do
      remove :project_id
    end
  end
end
