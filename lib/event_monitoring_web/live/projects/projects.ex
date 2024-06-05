defmodule EventMonitoringWeb.ProjectsLive do
  use EventMonitoringWeb, :live_view
  alias EventMonitoring.Projects

  def mount(_params, _session, socket) do
    {:ok, assign(socket, form: %{
      "project_name" => "",
    }, projects: Projects.list_projects())}
  end


  def render(assigns) do
    ~H"""
        <main class="flex min-h-sreen flex-col flex-1">
          <h1> List of Projects </h1>
          <.simple_form for={@form} phx-submit={"save"}>
            <.input type="text" class="m-0" field={@form["project_name"]} value={@form["project_name"]} name="project_name" placeholder="Project Name"> </.input>
            <.button class="m-0" type="submit">Create Project</.button>
          </.simple_form>
          <div class="flex flex-col gap-3">

            <ul class="space-y-3">
              <%= if length(@projects) == 0 do %>
                <li> No projects found </li>
              <% else %>
                <%= for project <- @projects do %>
                  <li><%= project.name %></li>
                <% end %>
              <% end %>
            </ul>
            </div>
        </main>
    """
  end

  def handle_event("save", unsigned_params, socket) do
    user_id = socket.assigns.current_user.id
    res = Projects.create_project(%{:name => unsigned_params["project_name"], :user_id => user_id})
    l = new_list(res, socket.assigns.projects)
    {:noreply, assign(socket, projects: l)}
  end


  defp new_list({:ok, key}, keys) do
    keys ++ [key]
  end

  defp new_list({:error, _}, keys) do
    keys
  end

end
