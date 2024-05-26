defmodule EventMonitoring.Repo.Migrations.RemovePublicFromKeys do
  use Ecto.Migration

  def change do
    alter table(:keys) do
      remove :public
    end
  end
end
