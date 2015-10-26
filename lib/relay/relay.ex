defmodule WebrtcGw.Relay.Relay do
  use GenServer
  require Logger

  #####
  # Client API

  def start_link do
    GenServer.start(__MODULE__, [], name: __MODULE__)
  end

  def start do
  end

  def stop do
  end

end
