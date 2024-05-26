defmodule EventMonitoring.Keys.Key do
  use Ecto.Schema
  import Ecto.Changeset

  schema "keys" do
    field :private, :binary
    field :salt, :binary
    belongs_to :user, EventMonitoring.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(key, attrs) do
    key
    |> cast(attrs, [:id, :private, :user_id, :salt])
    |> validate_required([:private, :user_id, :salt])
    |> unique_constraint(:id)
  end

  def generate_salt() do
    :crypto.strong_rand_bytes(32)
  end

  def generate_private() do
    :crypto.strong_rand_bytes(32)
  end

  def  hashing(private, salt) do
    :crypto.hash(:sha256, private <> salt)
  end

  def validate_private(private, stored_hash, salt) do
    hashed_private = hashing(private, salt)
    hashed_private == stored_hash
  end

  def generate_key() do
    private = generate_private()
    salt = generate_salt()
    hashed_private = hashing(private, salt)
    %{private: Base.encode64(hashed_private), salt: salt}
  end

end
