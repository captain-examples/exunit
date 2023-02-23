ExUnit.configure formatters: [JUnitFormatter, ExUnit.CLIFormatter], exclude: [pending: true]
ExUnit.start()
Ecto.Adapters.SQL.Sandbox.mode(Exunitexample.Repo, :manual)
