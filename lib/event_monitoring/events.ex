defmodule EventMonitoring.Events do
  @moduledoc """
  The Events context.
  """

  import Ecto.Query, warn: false
  alias EventMonitoring.Repo

  alias EventMonitoring.Events.Event
  alias EventMonitoring.Keys.Key
  alias EventMonitoring.Keys

  @doc """
  Returns the list of events.

  ## Examples

      iex> list_events()
      [%Event{}, ...]

  """
  def list_events do
    Repo.all(Event)
  end

  @doc """
  Gets a single event.

  Raises `Ecto.NoResultsError` if the Event does not exist.

  ## Examples

      iex> get_event!(123)
      %Event{}

      iex> get_event!(456)
      ** (Ecto.NoResultsError)

  """
  def get_event!({:id, id}), do: Repo.get!(Event, id)

  @doc """

  Gets a single event by name.

  Raises `Ecto.NoResultsError` if the Event does not exist.

  ## Examples

      iex> get_event!("name")
      %Event{}

      iex> get_event!("name")
      ** (Ecto.NoResultsError)
  """

  def get_event!({:name, name}), do: Repo.get_by!(Event, name: name)

  @doc """
  Creates a event.

  ## Examples

      iex> create_event(%{field: value})
      {:ok, %Event{}}

      iex> create_event(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_event(attrs \\ %{}) do
    keys = Keys.list_keys(attrs["user_id"])

    if Enum.empty?(keys) do
      {:error, "No key in this account"}
    end

    key_validated = Enum.find(keys, fn x -> Key.validate_private(attrs["key"], x.private, x.salt) end)

    IO.inspect("lost")
    IO.inspect(key_validated)

    attrs = Keyword.delete(attrs, :key)


    %Event{}
    |> Event.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a event.

  ## Examples

      iex> update_event(event, %{field: new_value})
      {:ok, %Event{}}

      iex> update_event(event, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_event(%Event{} = event, attrs) do
    event
    |> Event.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a event.

  ## Examples

      iex> delete_event(event)
      {:ok, %Event{}}

      iex> delete_event(event)
      {:error, %Ecto.Changeset{}}

  """
  def delete_event(%Event{} = event) do
    Repo.delete(event)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking event changes.

  ## Examples

      iex> change_event(event)
      %Ecto.Changeset{data: %Event{}}

  """
  def change_event(%Event{} = event, attrs \\ %{}) do
    Event.changeset(event, attrs)
  end
end
