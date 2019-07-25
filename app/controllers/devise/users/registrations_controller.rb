# frozen_string_literal: true

class Devise::Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
# after_action :create_address
 # after_action :create_address, only:[:create]


  def after_sign_up_path_for(resource)
          user_path(current_user.id)
      end

# def create_address
#   user = current_user
#   address = Address.new(family_name:user.family_name, )
  # address.family_name = user.family_name
  # address.first_name = user.first_name
  # address.sei = user.sei
  # address.mei = user.mei
  # address.postal_code = user.postal_code
  # address.phone_number = user.phone_number
  # address.address = user.address
  # address.save
# end

  # GET /resource/sign_up
   # def new
   #   @user = User.new
   # end

  # POST /resource
   # def create
   #  @user = User.new(user_params)
   #  @user.address.build
   #  address = Address.new(family_name:user.family_name, first_name:user.first_name, sei:user.sei, mei:user.mei, postal_code:user.postal_code,
   #                         phone_number:user.phone_number,adress:user.address)
   #  @user.save
   # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
# private


#   def user_params
#     params.require(:user).permit(:family_name, :first_name, :sei, :mei, :postal_code, :address, :phone_number, :email, :password)
#   end

# def create_address
#   unless current_user.address.exists?
#     user = current_user
#     address = Address.new(family_name:user.family_name, first_name:user.first_name, sei:user.sei, mei:user.mei, postal_code:user.postal_code,
#                           phone_number:user.phone_number,adress:user.address)
#     address.save
#   end
#  end

end