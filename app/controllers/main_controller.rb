class MainController < ApplicationController

  def index
  end

  def installing
  end

  private

  def oauth_client_id
    ENV["HEROKU_OAUTH_ID"]
  end

  def oauth_secret
    ENV["HEROKU_OAUTH_SECRET"]
  end
end
