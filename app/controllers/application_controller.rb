class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception, prepend: true

  DEVISE_SIGN_UP_FIELDS = %i[ email entreprise jobseeker password password_confirmation]
  DEVISE_UPDATE_FIELDS = %i[ email current_password]

  def after_sign_out_path_for(account)
    root_path
  end
  def after_sign_in_path_for(account)
    root_path
  end

  protected

  def configure_permitted_parameters

    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(DEVISE_SIGN_UP_FIELDS)}
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(DEVISE_UPDATE_FIELDS)}
  end
end
