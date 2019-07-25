class UsersController < ApplicationController

 # before_action :create_address, only:[:show]


  def show
    @user = User.find(params[:id])
    @addresses = @user.addresses
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "変更しました"
      redirect_to user_path(@user.id)
    else
      flash.now[:alert] = "失敗しました"
      render :edit
    end
  end

  def destroy
    user = User.find(params[:id])
    if user.destroy
     flash[:notice] = "退会しました"
     redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:family_name, :first_name, :sei, :mei, :postal_code, :address, :phone_number, :email, :password)
  end

 #   def create_address
 #  unless current_user.address.exists?
 #    user = current_user
 #    address = Address.new(family_name:user.family_name, first_name:user.first_name, sei:user.sei, mei:user.mei, postal_code:user.postal_code,
 #                          phone_number:user.phone_number,adress:user.address)
 #    address.save
 #  end
 # end

end
