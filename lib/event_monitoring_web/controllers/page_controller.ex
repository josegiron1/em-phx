defmodule EventMonitoringWeb.PageController do
  use EventMonitoringWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end

end
