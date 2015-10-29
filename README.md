# WebrtcGw

This application acts as a signaling and media gateway for forwarding video packets captured from an IP camera on local network to WebRTC endpoints over the Internet. The purpose of this gateway application is to enable IP cameras on private networks to be made accessible over Internet using the upcoming WebRTC technology.

This elixir application internaly makes use of Janus for WebRTC functionality and Gstreamer for capturing packets over local network from IP camera (RTSP) as well as transcoding of the media from H264 to VP8.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add webrtc_gw to your list of dependencies in `mix.exs`:

        def deps do
          [{:webrtc_gw, "~> 0.0.1"}]
        end

  2. Ensure webrtc_gw is started before your application:

        def application do
          [applications: [:webrtc_gw]]
        end
