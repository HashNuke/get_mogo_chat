defmodule GetMogoChat.Config.Prod do
  use GetMogoChat.Config

  config :router, port: System.get_env("PORT")

  config :plugs, code_reload: false

  config :logger, level: :error
end


