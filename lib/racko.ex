defmodule Racko do
  @moduledoc """
  Documentation for Racko.
  """
  use Application

  def start(_type, _args) do
    children = [
      {Registry, keys: :unique, name: Racko.GameRegistry},
      Racko.GameSupervisor
    ]

    :ets.new(:games_table, [:public, :named_table])

    opts = [strategy: :one_for_one, name: Racko.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
