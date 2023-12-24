defmodule PhoniexSpotify.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      PhoniexSpotifyWeb.Telemetry,
      PhoniexSpotify.Repo,
      {DNSCluster, query: Application.get_env(:phoniex_spotify, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: PhoniexSpotify.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: PhoniexSpotify.Finch},
      # Start a worker by calling: PhoniexSpotify.Worker.start_link(arg)
      # {PhoniexSpotify.Worker, arg},
      # Start to serve requests, typically the last entry
      PhoniexSpotifyWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PhoniexSpotify.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PhoniexSpotifyWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
