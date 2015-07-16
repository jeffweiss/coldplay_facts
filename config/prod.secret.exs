use Mix.Config

# In this file, we keep production configuration that
# you likely want to automate and keep it away from
# your version control system.
config :coldplay_facts_web, ColdplayFactsWeb.Endpoint,
  secret_key_base: "65fCnrajplfMp13Q7qVDIgbS02mPesA4BTYJRyrt/JQY+8bq1mLARgiap6doduR7"

# Configure your database
config :coldplay_facts_web, ColdplayFactsWeb.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "coldplay_facts_web_prod",
  size: 20 # The amount of database connections in the pool
