# 
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :allow_parameters, if: :devise_controller?

  protected

  def allow_parameters
    new_attributes = [:user_name, :email, :first_name, :last_name, :password,
                      :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: new_attributes
    devise_parameter_sanitizer.permit :account_update, keys: new_attributes
  end
end
