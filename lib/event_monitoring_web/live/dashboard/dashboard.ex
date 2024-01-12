defmodule EventMonitoringWeb.DashboardLive do
  use EventMonitoringWeb, :live_view

  def render(assigns) do
    ~H"""
    <div>
      <h1>Hello from dashboard</h1>
    </div>
    """
  end

end
