class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_sign_up_params, if: :devise_controller?

  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name role email password])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name email password current_password role])
  end

  def after_sign_in_path_for(_resource_or_scope)
    groups_path
  end

  def after_sign_out_path_for(_resource_or_scope)
    root_path
  end
end
