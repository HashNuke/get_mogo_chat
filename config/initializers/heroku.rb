require "heroku/client/cisaurus"
require "heroku/command/base"

Heroku::Command.load

ENV["HEROKU_BASE64_TOKEN"] = Base64.encode64(":#{ENV["HEROKU_API_KEY"]}").chomp
