class MainController < ApplicationController

  protect_from_forgery except: :gumroad

  caches_page :landing, expires_in: 60.seconds

  def index
  end

  def landing
    #TODO fetch non-anonymous contributors
    @top_contributors = Contributor.where("price > 0").order("price desc").limit(5)
  end

  def gumroad
    puts params.inspect
    render nothing: true
  end

end
