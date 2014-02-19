class SessionsController < ApplicationController

  def new
    redirect_to "/auth/heroku"
  end


  def create
    access_token = request.env['omniauth.auth']['credentials']['token']
    user_deploy = UserDeploy.create(oauth_token: access_token, platform: "heroku")
    user_deploy.delay.deploy!
    redirect_to "/installing"
  end
end
