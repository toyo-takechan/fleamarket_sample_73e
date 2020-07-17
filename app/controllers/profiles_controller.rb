class ProfilesController < ApplicationController

  def index
    @profile = Profile.new
  end

  def create
    @profile = Profile
  end


  private
  def profile_params
    params.require(:profile).permit(:family_name,:first_name).merge(user_id: current_user_id)
  end
end
