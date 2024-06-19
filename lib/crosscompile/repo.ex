defmodule Crosscompile.Repo do
  use Ecto.Repo,
    otp_app: :crosscompile,
    adapter: Ecto.Adapters.Postgres
end
