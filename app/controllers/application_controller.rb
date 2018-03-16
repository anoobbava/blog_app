# encoding: utf-8

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :allow_parameters, if: :devise_controller?

  protected

  def allow_parameters
    att = %i[user_name email first_name last_name password password_confirmation remember_me image]
    devise_parameter_sanitizer.permit :sign_up, keys: att
    devise_parameter_sanitizer.permit :account_update, keys: att
  end
end
