class ApplicationController < ActionController::Base
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  protected

  def configure_permitted_parameters
  	 devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:email, :password)}
  	 devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :name, :last_name, :city, :company_name, :middle_name, :description, :image) }
  	 devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :password, :password_confirmation, :current_password) }
  end

  def after_sign_in_path_for(resource)
    current_user
  end
end
