class OrdersController < ApplicationController

def new
end

def index
  @order = Order.new
  @user = current_user
  @cart_items = current_user.cart_items
  @cd = @cart_items.first.cd
  @disk = @cd.disks.first
  @music = @disk.musics.first
  @artist = @music.artist
end

def show
@order = Order.find(params[:id])
end

def create
  @oders  =Order.new
  @cart_items = current_user.cart_items
  @cart_items.each do |c|
    @order_detail = Order_detail.build(c.cd.id, c.cd.price, c.nuber)
    @order_detail.save
  end
  @cart_item.destroy
end

def edit
@order = Order.find(params[:id])
end

def update
end

def destroy
end



end
