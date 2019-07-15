class AddressesController < ApplicationController

def new
  @address = Address.new
end

def create
  address = Address.new(address_params)
  if address.save
  # redirect_toとpathを追加
else
  render :new
end
end

def edit
  @address = Address.find(params[:id])
end

def update
end

def destroy
end

end
