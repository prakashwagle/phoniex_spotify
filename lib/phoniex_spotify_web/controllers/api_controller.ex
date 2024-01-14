defmodule PhoniexSpotifyWeb.ApiController do
  use PhoniexSpotifyWeb, :controller
#POST /ask
  def ask(conn, %{"question" => question}) do
    url = Application.get_env(:phoniex_spotify, PhoniexSpotifyWeb.OllamaHelper)[:url]
    query = Application.get_env(:phoniex_spotify, PhoniexSpotifyWeb.OllamaHelper)[:query] <> question
    response = PhoniexSpotifyWeb.OllamaHelper.call_api(url, query)
    case response do
      {:ok, response} ->
        IO.inspect("Response: "<>response)
        body = Poison.decode!(response)
        result = body["response"]
        send_resp(conn, 200, "#{result} ?")
      {:error, error} ->
        IO.inspect(error)
    end
    send_resp(conn, 200, "Something went wrong please try afterwards")
  end
end
