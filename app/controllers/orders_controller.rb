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
  @cart_items_with_sum =  @cart_items.each_with_object([]) do |cart_item, array|
    cart_item_cd = cart_item.cd
    array << {
      name: cart_item_cd.name,
      price: cart_item_cd.price,
      number: cart_item.number,
      sum: cart_item_cd.price * cart_item.number
    }
  end
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
