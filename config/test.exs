use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :coldplay_facts_web, ColdplayFactsWeb.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :coldplay_facts_web, ColdplayFactsWeb.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "coldplay_facts_web_test",
  size: 1 # Use a single connection for transactional tests
