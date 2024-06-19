defmodule Crosscompile.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      CrosscompileWeb.Telemetry,
      Crosscompile.Repo,
      {DNSCluster, query: Application.get_env(:crosscompile, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Crosscompile.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Crosscompile.Finch},
      # Start a worker by calling: Crosscompile.Worker.start_link(arg)
      # {Crosscompile.Worker, arg},
      # Start to serve requests, typically the last entry
      CrosscompileWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Crosscompile.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    CrosscompileWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
