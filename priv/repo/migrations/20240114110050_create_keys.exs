defmodule EventMonitoring.Repo.Migrations.CreateKeys do
  use Ecto.Migration

  def change do
    create table(:keys) do
      add :public, :string
      add :private, :string
      add :project_id, references(:projects, on_delete: :nothing), null: false
      add :user_id, references(:users, on_delete: :nothing), null: false

      timestamps()
    end

    create index(:keys, [:id, :user_id])
    create index(:keys, [:id, :project_id])
    create unique_index(:keys, [:id])
  end
end
