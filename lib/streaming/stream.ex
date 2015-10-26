defmodule WebrtcGw.Streaming.Stream do
  use GenServer
  require Logger

  #####
  # Client API

  def start_link do
    GenServer.start(__MODULE__, [], name: __MODULE__)
  end

  def start do
    GenServer.call __MODULE__, :start
  end

  def stop do
    GenServer.call __MODULE__, :stop
  end

  #####
  # GenServer implementation

  def handle_call(:start, _from, state) do
  end

  def handle_call(:stop, _from, state) do
  end
end
