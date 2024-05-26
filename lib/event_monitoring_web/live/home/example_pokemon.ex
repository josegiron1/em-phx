defmodule EventMonitoringWeb.HomeLive.Index do
  use EventMonitoringWeb, :live_view

  def mount(_params, _session, socket) do
    case HTTPoison.get("https://pokeapi.co/api/v2/pokemon/ditto") do
      {:ok, %HTTPoison.Response{body: body}} ->
        {:ok, assign(socket, :pokemon, Jason.decode!(body)["name"])}
      {:error, _} ->
        {:ok, assign(socket, :pokemon, "Error")}
    end
  end

  def handle_event("get_pokemon", _, socket) do
    IO.puts "get_pokemon"
    get_pokemon(socket)
  end

  def handle_event("pokemon", _, socket) do
    {:noreply, socket}
  end

  def get_pokemon(socket) do
    HTTPoison.get("https://pokeapi.co/api/v2/pokemon/pikachu") |>
      response_handling(socket)
  end

  def response_handling({:ok, %HTTPoison.Response{body: body}}, socket) do
    {:noreply, assign(socket, :pokemon, Jason.decode!(body)["name"])}
  end

  def response_handling({:error, _}, socket) do
    {:noreply, socket}
  end

  # def render(assigns) do
  #   ~H"""
  #     <div>
  #     <h1>LiveView</h1>
  #     <p><%= @pokemon %></p>
  #     <.button phx-click="get_pokemon"> Get Pokemon </.button>
  #   </div>
  #   """
  # end

end
