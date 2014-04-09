defmodule GetMogoChat.Config.Test do
  use GetMogoChat.Config

  config :router, port: 4001,
                  ssl: false

  config :plugs, code_reload: true

  config :logger, level: :debug
end


