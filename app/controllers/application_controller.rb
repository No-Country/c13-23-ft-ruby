
class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name date_of_birth])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[first_name last_name date_of_birth])
  end
end