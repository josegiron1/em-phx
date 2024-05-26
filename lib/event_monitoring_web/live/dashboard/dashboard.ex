defmodule EventMonitoringWeb.DashboardLive do
  use EventMonitoringWeb, :live_view

  def render(assigns) do
    ~H"""
       <main class="flex min-h-[calc(100vh_-_theme(spacing.16))] flex-1 flex-row">
        <aside class="w-full md:w-64 flex-shrink-0 md:mr-6">
          <div class="sticky top-0 pt-4">
            <h2 class="font-semibold text-lg mb-2">Filter Events</h2>
            <div class="space-y-4">
              <div>
                <h3 class="font-semibold text-sm mb-2">By Date</h3>
                <input
                  class="flex h-10 rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50 w-full"
                  type="date"
                />
              </div>
              <div>
                <h3 class="font-semibold text-sm mb-2">By Location</h3>
                <input
                  class="flex h-10 rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50 w-full"
                  placeholder="Enter location"
                  type="text"
                />
              </div>
              <div>
                <h3 class="font-semibold text-sm mb-2">Go</h3>
                <button class="inline-flex items-center justify-center rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 bg-primary text-primary-foreground hover:bg-primary/90 h-10 px-4 py-2 w-full">
                  Apply Filters
                </button>
              </div>
            </div>
          </div>
        </aside>
        <div class="flex flex-col gap-3">
          <div class="grid lg:grid-cols-3 gap-8">
            <div class="rounded-lg border bg-card text-card-foreground shadow-sm" data-v0-t="card">
              <div class="p-6 flex flex-row items-center justify-between pb-2 space-y-0">
                <h3 class="tracking-tight text-sm font-medium">Total Events</h3>
                <svg
                  xmlns="http://www.w3.org/2000/svg"
                  width="24"
                  height="24"
                  viewBox="0 0 24 24"
                  fill="none"
                  stroke="currentColor"
                  stroke-width="2"
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  class="w-4 h-4 text-gray-500 dark:text-gray-400"
                >
                  <rect width="18" height="18" x="3" y="4" rx="2" ry="2"></rect>
                  <line x1="16" x2="16" y1="2" y2="6"></line>
                  <line x1="8" x2="8" y1="2" y2="6"></line>
                  <line x1="3" x2="21" y1="10" y2="10"></line>
                </svg>
              </div>
              <div class="p-6">
                <div class="text-2xl font-bold">1,234</div>
                <p class="text-xs text-gray-500 dark:text-gray-400">+20.1% from last month</p>
              </div>
            </div>
            <div class="rounded-lg border bg-card text-card-foreground shadow-sm" data-v0-t="card">
              <div class="p-6 flex flex-row items-center justify-between pb-2 space-y-0">
                <h3 class="tracking-tight text-sm font-medium">Active Now</h3>
                <svg
                  xmlns="http://www.w3.org/2000/svg"
                  width="24"
                  height="24"
                  viewBox="0 0 24 24"
                  fill="none"
                  stroke="currentColor"
                  stroke-width="2"
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  class="w-4 h-4 text-gray-500 dark:text-gray-400"
                >
                  <path d="M22 12h-4l-3 9L9 3l-3 9H2"></path>
                </svg>
              </div>
              <div class="p-6">
                <div class="text-2xl font-bold">+573</div>
                <p class="text-xs text-gray-500 dark:text-gray-400">+201 since last hour</p>
              </div>
            </div>
          </div>
          <div>
            <div class="rounded-lg border bg-card text-card-foreground shadow-sm" data-v0-t="card">
              <div class="relative w-full overflow-auto">
                <table class="w-full caption-bottom text-sm">
                  <thead class="[&amp;_tr]:border-b">
                    <tr class="border-b transition-colors hover:bg-muted/50 data-[state=selected]:bg-muted">
                      <th class="h-12 px-4 text-left align-middle font-medium text-muted-foreground [&amp;:has([role=checkbox])]:pr-0 w-[100px]">
                        Event
                      </th>
                      <th class="h-12 px-4 text-left align-middle font-medium text-muted-foreground [&amp;:has([role=checkbox])]:pr-0">
                        Date
                      </th>
                      <th class="h-12 px-4 text-left align-middle font-medium text-muted-foreground [&amp;:has([role=checkbox])]:pr-0">
                        Location
                      </th>
                      <th class="h-12 px-4 align-middle font-medium text-muted-foreground [&amp;:has([role=checkbox])]:pr-0 text-right">
                        Details
                      </th>
                    </tr>
                  </thead>
                  <tbody class="[&amp;_tr:last-child]:border-0">
                    <tr class="border-b transition-colors hover:bg-muted/50 data-[state=selected]:bg-muted">
                      <td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0 font-medium">Event 1</td>
                      <td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">2024-01-14</td>
                      <td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">Location 1</td>
                      <td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0 text-right">
                        <a class="text-blue-500 hover:underline" href="#">
                          View Details
                        </a>
                      </td>
                    </tr>
                    <tr class="border-b transition-colors hover:bg-muted/50 data-[state=selected]:bg-muted">
                      <td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0 font-medium">Event 2</td>
                      <td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">2024-01-15</td>
                      <td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">Location 2</td>
                      <td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0 text-right">
                        <a class="text-blue-500 hover:underline" href="#">
                          View Details
                        </a>
                      </td>
                    </tr>
                    <tr class="border-b transition-colors hover:bg-muted/50 data-[state=selected]:bg-muted">
                      <td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0 font-medium">Event 3</td>
                      <td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">2024-01-16</td>
                      <td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">Location 3</td>
                      <td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0 text-right">
                        <a class="text-blue-500 hover:underline" href="#">
                          View Details
                        </a>
                      </td>
                    </tr>
                    <tr class="border-b transition-colors hover:bg-muted/50 data-[state=selected]:bg-muted">
                      <td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0 font-medium">Event 4</td>
                      <td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">2024-01-17</td>
                      <td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">Location 4</td>
                      <td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0 text-right">
                        <a class="text-blue-500 hover:underline" href="#">
                          View Details
                        </a>
                      </td>
                    </tr>
                    <tr class="border-b transition-colors hover:bg-muted/50 data-[state=selected]:bg-muted">
                      <td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0 font-medium">Event 5</td>
                      <td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">2024-01-18</td>
                      <td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">Location 5</td>
                      <td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0 text-right">
                        <a class="text-blue-500 hover:underline" href="#">
                          View Details
                        </a>
                      </td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
      </main>
    """
  end

end
