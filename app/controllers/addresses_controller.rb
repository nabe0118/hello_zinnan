class AddressesController < ApplicationController
	def index
		@addresses = current_user.addresses
	end

	def new
	  @address = Address.new
	end

	def show
		@address = Address.find(params[:id])
	end

	def create
	   @address = Address.new(address_params)
	   @address.user_id = current_user.id
	  if @address.save
	  redirect_to user_path(current_user.id)
	  else
	  render :new
	  end
	end

	def edit
	  @address = Address.find(params[:id])
	end

	def update
		address = Address.find(params[:id])
		address.user_id = current_user.id
		if  address.update(address_params)
		redirect_to user_path(current_user.id)
	    else
	    render :edit
	    end
	end

	def destroy
		address = Address.find(params[:id])
		if address.destroy
			redirect_to user_path(current_user.id)
		else
			render :index
		end
    end

  private

  def address_params
  	params.require(:address).permit(:family_name, :first_name, :sei, :mei, :postal_code, :address, :phone_number,)
  end
end
