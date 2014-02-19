class MainController < ApplicationController

  helper :heroku_oauth_url

  def index
  end

  private

  def oauth_client_id
    ENV["HEROKU_OAUTH_ID"]
  end

  def oauth_secret
    ENV["HEROKU_OAUTH_SECRET"]
  end
end
