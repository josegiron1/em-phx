defmodule EventMonitoring.Repo do
  use Ecto.Repo,
    otp_app: :event_monitoring,
    adapter: Ecto.Adapters.Postgres
end
