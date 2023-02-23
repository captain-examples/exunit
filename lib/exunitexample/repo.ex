defmodule Exunitexample.Repo do
  use Ecto.Repo,
    otp_app: :exunitexample,
    adapter: Ecto.Adapters.SQLite3
end
