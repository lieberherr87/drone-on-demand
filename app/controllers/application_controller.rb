class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :pilot, :avatar, :avatar_cache])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :pilot, :avatar, :avatar_cache])
  end

  before_action :authenticate_user!
  include Pundit


  # Uncomment when you *get* Pundit!
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized


  private
  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(root_path)
  end
end


