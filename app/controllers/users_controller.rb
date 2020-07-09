class UsersController < ApplicationController

  def index
    @user = User.new
    @profile = Profile.new
  end

  def new
  end
  
  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  
  private

  def user_params
    params.require(:user).permit(:nickname, :email).merge(user_id: current_user.id)
  end
  
end
