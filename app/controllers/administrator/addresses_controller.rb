class Administrator::AddressesController < ApplicationController

  before_action :authenticate_admin!

  def index
      @user = User.find(params[:id])
      @addresses = @user.addresses
  end

  def show
    @address = Address.find(params[:id])
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    address = Address.find(params[:id])
    address.user_id = current_user.id
    if  address.update(address_params)
    redirect_to administrator_end_user_path(current_user.id)
      else
      render :edit
      end
  end

  def destroy
    address = Address.find(params[:id])
    if address.destroy
      redirect_to administrator_end_user_path(user.id)
    else
      render :index
    end
    end

private
 def address_params
   params.require(:address).permit(:family_name, :first_name, :sei, :mei, :postal_code, :address, :phone_number,)
 end

end
