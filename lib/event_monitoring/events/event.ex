defmodule EventMonitoring.Events.Event do
  use Ecto.Schema
  import Ecto.Changeset

  schema "events" do
    field :name, :string
    field :params, :map
    belongs_to :user, EventMonitoring.Accounts.User
    belongs_to :project, EventMonitoring.Projects.Project

    timestamps()
  end

  @doc false
  def changeset(event, attrs) do
    event
    |> cast(attrs, [:name, :params, :user_id, :project_id])
    |> validate_required([:name, :user_id, :project_id])
  end
end
