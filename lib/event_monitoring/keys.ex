defmodule EventMonitoring.Keys do
  @moduledoc """
  The Keys context.
  """

  import Ecto.Query, warn: false
  alias Hex.API.Key
  alias EventMonitoring.Repo

  alias EventMonitoring.Keys.Key

  @doc """
  Returns the list of keys.

  ## Examples

      iex> list_keys()
      [%Key{}, ...]

  """
  def list_keys(userId) do
    Repo.all(from k in Key, where: k.user_id == ^userId)
  end


  @doc """
  Gets a single key.

  Raises `Ecto.NoResultsError` if the Key does not exist.

  ## Examples

      iex> get_key!(123)
      %Key{}

      iex> get_key!(456)
      ** (Ecto.NoResultsError)

  """
  def get_key!(id), do: Repo.get!(Key, id)

  @doc """
  Creates a key.

  ## Examples

      iex> create_key(%{field: value})
      {:ok, %Key{}}

      iex> create_key(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_key(attrs \\ %{}) do
    key_salt = Key.generate_key()
    attrs = Map.put(attrs, :private, key_salt[:private])
    attrs = Map.put(attrs, :salt, key_salt[:salt])
    %Key{}
    |> Key.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a key.

  ## Examples

      iex> update_key(key, %{field: new_value})
      {:ok, %Key{}}

      iex> update_key(key, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_key(%Key{} = key, attrs) do
    key
    |> Key.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a key.

  ## Examples

      iex> delete_key(key)
      {:ok, %Key{}}

      iex> delete_key(key)
      {:error, %Ecto.Changeset{}}

  """
  def delete_key(%Key{} = key) do
    Repo.delete(key)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking key changes.

  ## Examples

      iex> change_key(key)
      %Ecto.Changeset{data: %Key{}}

  """
  def change_key(%Key{} = key, attrs \\ %{}) do
    Key.changeset(key, attrs)
  end
end
