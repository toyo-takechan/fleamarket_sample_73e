# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController


  def new
    @user = User.new
    @user.build_profile
    @user.build_address
  end

  # POST /resource
  def create
    @user = User.new(user_params)
  if @user.save
      sign_in(@user)
      flash[:alert] = 'ようこそ！ アカウントが登録されました'
      redirect_to root_path
  else
    flash[:alert] = '必須事項を入力してください。'
    redirect_to controller: :registrations, action: :new
  end
  end

  private

  def user_params
    #params[:user][:profile_attributes][:birthday] = params[:birthday]["birthday(1i)"] + "-" + params[:birthday]["birthday(2i)"] + "-" + params[:birthday]["birthday(3i)"]
    params.require(:user).permit(:nickname, :email, :password,profile_attributes: [:first_name, :family_name, :first_name_kana, :family_name_kana, :birth_day, :birth_month, :birth_year],address_attributes: [:post_code, :prefecture_id, :city, :house_number, :building_name, :telephone_number,])
  end
  
end