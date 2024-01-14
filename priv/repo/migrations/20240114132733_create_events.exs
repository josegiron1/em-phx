defmodule EventMonitoring.Repo.Migrations.CreateEvents do
  use Ecto.Migration

  def change do
    create table(:events) do
      add :name, :string
      add :params, :map
      add :user_id, references(:users, on_delete: :nothing), null: false
      add :project_id, references(:projects, on_delete: :nothing), null: false

      timestamps()
    end

    create index(:events, [:id, :user_id])
    create unique_index(:events, [:id])
  end
end
