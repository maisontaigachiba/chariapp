class ApplicationController < ActionController::Base
  before_action :configue_permitted_parameters, if: :devise_controller?


  private
  
  def configue_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end

end
