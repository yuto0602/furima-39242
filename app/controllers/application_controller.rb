class ApplicationController < ActionController::Base
  before_action :authenticate_user!, only: [:new]
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :user_last_name, :user_first_name, :user_last_name_add,:user_first_name_add, :birthday])
  end
end
