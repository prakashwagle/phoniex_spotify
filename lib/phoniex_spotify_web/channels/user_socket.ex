defmodule PhoniexSpotifyWeb.UserSocket do
  use Phoenix.Socket

  ## Channels
  channel "room:lobby", PhoniexSpotifyWeb.RoomChannel

  ## Transports
  # transport :websocket, Phoenix.Transports.WebSocket

  ## Serializer
  # serializer PhoniexSpotifyWeb.SocketSerializer

  ## Socket params
  def connect(_params, socket) do
    {:ok, socket}
  end

  def id(_socket), do: nil
end
