class SessionsController < ApplicationController

  def new
    redirect_to "/auth/heroku"
  end


  def create
    access_token = request.env['omniauth.auth']['credentials']['token']
    UserDeploy.create(oauth_token: access_token, platform: "heroku")
    redirect_to "/installing"
  end
end