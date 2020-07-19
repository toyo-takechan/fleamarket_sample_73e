class SessionController < ApplicationController

  protect_from_forgery except: [:new, :create]

  def new
  end

  def create
  end
  
end

