class ApplicationController < ActionController::Base
  before_action :configue_permitted_parameters, if: :devise_controller?
  rescue_from ActiveRecord::RecordNotFound, with: :render_404
  rescue_from ActionController::RoutingError, with: :render_404
  rescue_from Exception, with: :render_500
  
  def render_404
    render template: 'errors/error_404', status: 404, layout: 'application', content_type: 'text/html'
  end
  
  def render_500
    render template: 'errors/error_500', status: 500, layout: 'application', content_type: 'text/html'
  end  
  def after_sign_in_path_for(resouce)
    bikes_path
  end

  def after_sign_up_path_for(resouce)
    bikes_path
  end

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

  protected
  
  def configue_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end

end
