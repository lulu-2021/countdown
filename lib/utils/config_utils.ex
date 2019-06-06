defmodule Countdown.Utils.ConfigUtils do
  @moduledoc """
  """
  require Logger

  @default_return_to_url "lvh.me:4000"

  def return_to_url do
    case Confex.fetch_env(:countdown, :auth0_return_to_url) do
      {:ok, url} ->
        url

      :error ->
        message =
          "CONFIGURATION ERROR - AUTH0_RETURN_TO_URL not set in .ENV settings - using DEFAULT"

        Logger.info(message)

        @default_return_to_url
    end
  end
end
