defmodule EventMonitoringWeb.SettingsLive do
  use EventMonitoringWeb, :live_view

  alias EventMonitoring.Keys

  def mount(_params, _session, socket) do
    user_id = socket.assigns.current_user.id
    keys = Keys.list_keys(user_id)
    {:ok, assign(socket, :keys, keys)}
  end

  def handle_event("generate_key", _unsigned_params, socket) do
    user_id = socket.assigns.current_user.id
    res = Keys.create_key(%{user_id: user_id})
    new_socket = socket |>
    assign(keys: Keys.list_keys(user_id))
    case res do
      {:ok, _} -> {:noreply, new_socket}

      {:error, _} -> {:noreply, socket}

    end

  end

  def result({:ok, _}, socket) do
    {:noreply, socket}
  end

  def result({:error, _}, socket) do
    {:noreply, socket}
  end

  def render(assigns) do
    ~H"""
    <div class="flex flex-col gap-3">
      <div class="flex gap-3 items-center">
        <h1> List of Keys </h1>
        <p> Please keep your private key safe </p>
      </div>
      <ul class="space-y-3">
        <%= if length(@keys) == 0 do %>
          <li> No keys found </li>
        <% else %>
          <%= for key <- @keys do %>
            <li><%= key.private %></li>
          <% end %>
        <% end %>
      </ul>
      <div class="space-y-3">
        <.button  phx-click="generate_key"> Generate Key </.button>
      </div>
    </div>
    """
  end
end
