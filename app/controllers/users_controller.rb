class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit,:profile,:profile_update,:logout]

  def index
    @user = User.new
    @profile = Profile.new
  end

  # def new
  # end
  
  def edit
  end

  # def update
  #   if current_user.update(user_params)
  #     redirect_to root_path
  #   else
  #     render :edit
  #   end
  # end

  def logout
  end
 
  def update
    if @address.update(address_params)
      redirect_to edit_user_path(@address)
    else
      render :edit
    end
  end
  def profile   
  end

  def profile_update
    if @user.update(user_params)
      redirect_to user_path
    else
      render :profile
    end
  end
  def ready
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email)
  end
  
  def set_user
    @user = User.find(params[:id])
  end

end
