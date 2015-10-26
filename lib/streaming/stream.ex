defmodule WebrtcGw.Streaming.Stream do
  use GenServer
  require Logger

  alias Porcelain.Process, as: Proc
  alias Porcelain.Result

  #####
  # Client API

  def start_link(init_params) do
    GenServer.start(__MODULE__, init_params, name: __MODULE__)
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

    alias Porcelain.Process, as: Proc

    IO.puts "Entering Janus: start current state: #{inspect state}"

    unless state == nil do
      case Proc.alive?(state) do
        true ->
          Proc.stop(state)
          IO.puts "Stopped"
        false ->
      end
    end

    proc = Porcelain.spawn("/home/rajmohan/evercam/opt/janus/bin/janus", [],[])
    IO.puts "Hola! Janus process is #{inspect proc.pid}"

    { :reply, :ok, proc }
  end

  def handle_call(:stop, _from, state) do
    IO.puts "So we are stopping Janus here now: #{inspect state}"

    unless state == nil do
      case Proc.alive?(state) do
        true ->
          IO.puts "Lets kill him?"
          Proc.stop(state)
          state = nil
        false ->
      end
    end

    { :reply, :ok, state }
  end
end
