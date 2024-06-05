defmodule EventMonitoringWeb.KeyController do
  use EventMonitoringWeb, :controller

  alias EventMonitoring.Keys
  alias EventMonitoring.Keys.Key

  action_fallback EventMonitoringWeb.FallbackController

  def index(conn, _params) do
    user_id = conn.assigns.current_user.id
    keys = Keys.list_keys(user_id)
    render(conn, :index, keys: keys)
  end

  def create(conn, %{"key" => key_params}) do
    with {:ok, %Key{} = key} <- Keys.create_key(key_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/keys/#{key}")
      |> render(:show, key: key)
    end
  end

  def show(conn, %{"id" => id}) do
    key = Keys.get_key!(id)
    render(conn, :show, key: key)
  end

  def update(conn, %{"id" => id, "key" => key_params}) do
    key = Keys.get_key!(id)

    with {:ok, %Key{} = key} <- Keys.update_key(key, key_params) do
      render(conn, :show, key: key)
    end
  end

  def delete(conn, %{"id" => id}) do
    key = Keys.get_key!(id)

    with {:ok, %Key{}} <- Keys.delete_key(key) do
      send_resp(conn, :no_content, "")
    end
  end
end
