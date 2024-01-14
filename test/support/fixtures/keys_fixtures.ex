defmodule EventMonitoring.KeysFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `EventMonitoring.Keys` context.
  """

  @doc """
  Generate a unique key id.
  """
  def unique_key_id, do: System.unique_integer([:positive])

  @doc """
  Generate a key.
  """
  def key_fixture(attrs \\ %{}) do
    {:ok, key} =
      attrs
      |> Enum.into(%{
        event_id: 42,
        id: unique_key_id(),
        private: "some private",
        public: "some public"
      })
      |> EventMonitoring.Keys.create_key()

    key
  end
end
