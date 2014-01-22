class ApplicationController < ActionController::Base
  before_filter :authenticate_user!
  before_filter :update_sanitized_params, if: :devise_controller?
  protect_from_forgery

  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end

  def update_sanitized_params
    devise_parameter_sanitizer.for(:sign_up) << :name
  end
end
