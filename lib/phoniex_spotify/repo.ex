defmodule PhoniexSpotify.Repo do
  use Ecto.Repo,
    otp_app: :phoniex_spotify,
    adapter: Ecto.Adapters.Postgres
end
