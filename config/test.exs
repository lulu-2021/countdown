use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :countdown, CountdownWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :countdown, Countdown.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: {:system, :string, "DB_ENV_POSTGRES_USER"},
  password: {:system, :string, "DB_ENV_POSTGRES_PASSWORD"},
  database: {:system, :string, "DB_ENV_TEST_NAME"},
  hostname: {:system, :string, "DB_ENV_POSTGRES_HOST"},
  pool: Ecto.Adapters.SQL.Sandbox

config :countdown,
  auth0_return_to_url: {:system, :string, "AUTH0_RETURN_TO_URL", "lvh.me:4000"},
