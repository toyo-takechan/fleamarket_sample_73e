class ApplicationController < ActionController::Base

  before_action :basic_auth, if: :production?
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

private

def production?
  Rails.env.production?
end

def basic_auth
  authenticate_or_request_with_http_basic do |username, password|
    username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
  end
end

protected

def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :email, :password,profile_attributes: [:first_name, :family_name, :first_name_kana, :family_name_kana, :birth_day, :birth_month, :birth_year],address_attributes: [:post_code, :prefecture_id, :city, :house_number, :building_name, :telephone_number,]])

end
end