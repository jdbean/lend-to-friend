class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  layout :determine_layout

  def determine_layout
    module_name = self.class.to_s.split("::").first
    return (module_name.eql?("Devise") ? "admin" : "application")
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def after_sign_in_path_for(users)
    items_path
  end

end
