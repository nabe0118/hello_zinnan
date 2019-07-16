class ApplicationController < ActionController::Base

	before_action :configure_permitted_parameters, if: :devise_controller?

protected
 def configure_permitted_parameters
   devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :family_name, :first_name, :sei, :mei, :postal_code, :address, :phone_number])
 end


end
