import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :exunitexample, Exunitexample.Repo,
  database: Path.expand("../exunitexample_test.db", Path.dirname(__ENV__.file)),
  pool_size: 5,
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :exunitexample, ExunitexampleWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "mzNHxJ2dDYjMsHXxHanBLYhlk3jQl+rxbNIIVsOABaaO0bpPJuj6b0ZLPytokzSH",
  server: false

# In test we don't send emails.
config :exunitexample, Exunitexample.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime

config :junit_formatter,
  report_dir: Path.expand("../tmp/junit", __DIR__),
  project_dir: Path.expand("..", __DIR__),
  automatic_create_dir?: true,
  print_report_file: true,
  prepend_project_name?: true,
  include_filename?: true,
  include_file_line?: true
