defmodule EventMonitoring.Projects.Project do
  use Ecto.Schema
  import Ecto.Changeset

  schema "projects" do
    field :name, :string
    belongs_to :user, EventMonitoring.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(project, attrs) do
    project
    |> cast(attrs, [:name, :user_id])
    |> validate_required([:name, :user_id])
  end
end
