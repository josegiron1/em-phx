defmodule EventMonitoring.EventsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `EventMonitoring.Events` context.
  """

  @doc """
  Generate a unique event id.
  """
  def unique_event_id, do: System.unique_integer([:positive])

  @doc """
  Generate a event.
  """
  def event_fixture(attrs \\ %{}) do
    {:ok, event} =
      attrs
      |> Enum.into(%{
        id: unique_event_id(),
        name: "some name",
        params: %{}
      })
      |> EventMonitoring.Events.create_event()

    event
  end
end
