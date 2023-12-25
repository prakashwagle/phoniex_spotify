defmodule PhoniexSpotifyWeb.ApiController do
  use PhoniexSpotifyWeb, :controller
#POST /ask
  def ask(conn, %{"question" => question}) do
    # Your code logic for handling the /ask endpoint goes here
    # ...
    # Return a response
    send_resp(conn, 200, "Hello from /ask endpoint, is this your question : #{question} ?")
  end
end
