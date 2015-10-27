defmodule WebrtcGw.Relay.Relay do
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

    IO.puts "Entering Gstreamer: start"

    unless state == nil do
      case Proc.alive?(state) do
        true ->
          Proc.stop(state)
          IO.puts "stopped"
        false ->
      end
    end

    proc = Porcelain.spawn("/usr/local/bin/gst-launch-1.0", ["rtspsrc", "location=rtsp://admin:12345@192.168.1.100/h264/ch1/main/av_stream", "name=src", "!", "rtph264depay", "!", "queue", "!", "avdec_h264", "!", "videoconvert", "!", "videoscale", "!", "queue", "!", "vp8enc", "target-bitrate=256000", "error-resilient=true" , "!", "rtpvp8pay", "!", "udpsink", "host=127.0.0.1", "port=5004"],[])
    IO.puts "Hola! Gstreamer process is #{inspect proc.pid}"

    { :reply, :ok, proc }
  end

  def handle_call(:stop, _from, state) do
    IO.puts "So we are stopping Gstreamer here now: #{inspect state}"

    unless state == nil do
      case Proc.alive?(state) do
        true ->
          IO.puts "Lets kill him?"
          Proc.stop(state)
          state = nil

        false ->
          IO.puts "This guy doesnt exist"
      end
    end

    { :reply, :ok, state }
  end

end
