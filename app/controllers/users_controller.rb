class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def user_params
  	params.require(:user).permit(:familiy_name, :first_name, :sei, :mei, :postal_code, :address, :phone_number, :email, :password)
  end
end
