defmodule EventMonitoring.Keys.Key do
  use Ecto.Schema
  import Ecto.Changeset

  schema "keys" do
    field :private, :binary
    field :public, :string
    belongs_to :project, EventMonitoring.Projects.Project
    belongs_to :user, EventMonitoring.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(key, attrs) do
    key
    |> cast(attrs, [:id, :public, :private, :event_id, :user_id])
    |> validate_required([:id, :public, :private, :event_id, :user_id])
    |> unique_constraint(:id)
  end

  def generate_salt() do
    :crypto.strong_rand_bytes(32)
    |> Base.encode16(case: :lower)
  end

  def generate_private() do
    :crypto.strong_rand_bytes(32)
  end

  def encode_private(private) do
    Base.encode64(private)
  end

  def  hashing(private) do
    :crypto.hash(:sha256, private <> generate_salt()) |> Base.encode16()
  end

  def validate_private(private) do
    private == encode_private(hashing(private))
  end

end
