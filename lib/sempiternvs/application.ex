defmodule Sempiternvs.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false
  import Supervisor.Spec
  use Application

  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      SempiternvsWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Sempiternvs.PubSub},
      # Start the Endpoint (http/https)
      SempiternvsWeb.Endpoint,

      worker(Mongo, [[name: :mongo, database: "sempiternvs"]])      
      # Start a worker by calling: Sempiternvs.Worker.start_link(arg)
      # {Sempiternvs.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Sempiternvs.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    SempiternvsWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
