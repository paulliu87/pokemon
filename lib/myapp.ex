defmodule Myapp do
  @moduledoc """
  This is sthemain application for our mix appllcaition
  """
  use Application

  @doc """
  ## Examples

    iex> start([], [])
  """
  def start(_type, _args) do
    import Supervisor.Spec, warn: false
    children = [
      worker(Myapp.Router, []),
      worker(Myapp.ApiHandler, [])
    ]
    opts = [
      strategy: :one_for_one, name: Myapp.Supervisor
    ]
    Supervisor.start_link(children, opts)
  end
  @moduledoc """
  Documentation for Myapp.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Myapp.hello
      :world

  """
  def hello do
    :world
  end
end
