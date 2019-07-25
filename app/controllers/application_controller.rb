class ApplicationController < ActionController::Base

	before_action :configure_permitted_parameters, if: :devise_controller?

	 # def after_sign_up_path_for(resource)
  #          new_address_path
  #    end

protected
 def configure_permitted_parameters
   devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :family_name, :first_name, :sei, :mei, :postal_code, :phone_number, :address])
 end


end
