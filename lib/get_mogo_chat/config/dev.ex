defmodule GetMogoChat.Config.Dev do
  use GetMogoChat.Config

  config :router, port: 4000,
                  ssl: false

  config :plugs, code_reload: true

  config :logger, level: :debug
end


