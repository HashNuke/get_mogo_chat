class SessionsController < ApplicationController

  def new
    redirect_to "/auth/heroku"
  end


  def create
    access_token = request.env['omniauth.auth']['credentials']['token']
    puts request.env['omniauth.auth'].inspect
    redirect_to "/installing"
  end
end