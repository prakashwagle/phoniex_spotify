defmodule PhoniexSpotifyWeb.OllamaHelper do
  def call_api(url, query) do
    headers = [
      {"Content-Type", "application/json"}
      # {"Connection", "keep-alive"}
    ]

    body = %{
      "model" => "mistral:instruct",
      "prompt" => query,
      "stream" => false
    }

    encodeBody = Poison.encode!(body)
    IO.inspect("encodeBody: " <> encodeBody) # Print encoded body for debugging
    IO.inspect("url: " <> url) # Print url for debugging
    case HTTPoison.post(url, encodeBody, headers) do
      {:ok, %{status_code: 200, body: response_body}} ->
        IO.inspect("Response: " <> response_body) # Print response body for debugging
        {:ok, response_body}
      {:ok, %{status_code: status_code, body: response_body}} ->
        IO.inspect("Response: " <> response_body) # Print response body for debugging
        {:error, "API call failed with status code #{status_code}: #{response_body}"}
      {:error, error} ->
        IO.inspect("Error: " <> error) # Print response body for debugging
        {:error, "API call failed: #{inspect(error)}"}
      {_, _} ->
        IO.inspect("Error: ") # Print response body for debugging
        {:error, "API call failed: unknown error"}
    end
  end
end
