class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    stored_location_for(resource) ||posts_path
  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:[:name, :last_name])
    devise_parameter_sanitizer.permit(:account_update, keys:[:name, :last_name])
    devise_parameter_sanitizer.permit(:actualizar_rol, keys:[:rol])
    devise_parameter_sanitizer.permit(:sign_up, keys:[:rol])
    devise_parameter_sanitizer.permit(:account_update, keys:[:rol])

  end

end
