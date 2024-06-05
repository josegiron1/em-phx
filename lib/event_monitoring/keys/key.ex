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
    key = Base.encode64(private)
    salty = Base.encode64((salt))
    :crypto.hash(:sha256, key <> salty)
  end

  def validate_private(private_str, stored_private, salt_str) do
    private = Base.decode64!(private_str)
    salt = Base.decode64!(salt_str)
    stored_hash = Base.decode64!(stored_private)

    hashed_private = hashing(private, salt)

    IO.inspect(hashed_private == stored_hash)
    IO.inspect(hashed_private)
    IO.inspect(stored_hash)

    hashed_private == stored_hash
  end

  def generate_key() do
    private = generate_private()
    salt = generate_salt()
    hashed_private = hashing(private, salt)
    %{private: Base.encode64(private), salt: salt}
  end

end
