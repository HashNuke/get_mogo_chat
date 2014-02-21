class MainController < ApplicationController

  protect_from_forgery except: :gumroad

  def index
  end

  def installing
  end

  def gumroad
    puts params.inspect
    render :nothing => true
  end

end
