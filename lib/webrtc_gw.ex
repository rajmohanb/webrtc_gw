defmodule WebrtcGw do
  use Application

  def start(_type, _args) do
    { :ok, _pid } = WebrtcGw.Supervisor.start_link([nil])
  end
end
