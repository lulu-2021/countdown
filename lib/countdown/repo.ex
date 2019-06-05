defmodule Countdown.Repo do
  use Ecto.Repo,
    otp_app: :countdown,
    adapter: Ecto.Adapters.Postgres

  alias Confex.Resolver

  require Logger

  def init(_, config) do
    url = System.get_env("DATABASE_URL")
    config = if url, do: [url: url] ++ config, else: Resolver.resolve!(config)
    print_config(config)

    unless config[:database] do
      raise "SET DB_NAME environment variable"
    end

    {:ok, config}
  end

  def print_config(config) do
    connect_message = """
      \n---------------------\n
      \n DATABASE CONFIG:\n
      #{inspect(config)}
      \n---------------------\n
    """

    Logger.info(connect_message)
  end
end
