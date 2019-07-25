class Administrator::EndUsersController < ApplicationController
  before_action :authenticate_admin!

  def index
  	@users = User.page(params[:page]).per(15)
  end

  def show
  	@user = User.find(params[:id])
    @addresses = @user.addresses
  end

  def edit
  	@user = User.find(params[:id])
    @addresses = @user.addresses
  end

  def update
  	user = User.find(params[:id])
  	user.update(user_params)
  end

  def destroy
  	user = User.find(params[:id])
  	user.destroy
  	redirect_to administrator_end_users_path
  end

  private
 def address_params
   params.require(:address).permit(:family_name, :first_name, :sei, :mei, :postal_code, :address, :phone_number,)
 end
 def user_params
   params.require(:user).permit(:family_name, :first_name, :sei, :mei, :postal_code, :address, :phone_number)
 end
end
