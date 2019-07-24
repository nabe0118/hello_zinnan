class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(uaer_params)
  end

  def destroy
    user = User.find(params[:id])
    if user.destroy
     flash[:notice] = "退会しました"
     redirect_to top_path
    end
  end

  def index
  end

  private

  def user_params
    params.require(:user).permit(:familiy_name, :first_name, :sei, :mei, :postal_code, :address, :phone_number, :email, :password)
  end

end
