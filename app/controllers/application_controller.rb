class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  
	protected
			def configure_permitted_parameters
			devise_parameter_sanitizer.for(:sign_up) << :name
			devise_parameter_sanitizer.for(:account_update) << :name


  end

  
 
def authenticate!
    if vistoriadore_signed_in? || franqueado_signed_in?  || manager_signed_in? 
    else
      redirect_to root_path
    end
end


  
end
