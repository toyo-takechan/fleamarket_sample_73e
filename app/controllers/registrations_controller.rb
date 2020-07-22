class RegistrationsController < ApplicationController
  def index
  end

  def create
    @profile = Profile
    params.require(:user).permit(:name)
  end

end

