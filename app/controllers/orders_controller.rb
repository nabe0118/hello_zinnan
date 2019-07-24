class OrdersController < ApplicationController

  before_action :authenticate_user!
  before_action :check_carts

  def check_carts
    unless current_user.cart_items.exists?
      flash[:notice] ="カートに入っている商品がありません"
    redirect_to cds_path
    end
  end

def new
end

def index
  @order = Order.new
  @user = current_user
  @addresses = @user.addresses
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
  @order  =Order.new(order_params)
  @order.user_id = current_user.id
  @cart_items = current_user.cart_items
  if @order.save
    @cart_items.each do |cart|
      cd = cart.cd
      cd.stock = cd.stock - cart.number
      cd.update(stock:cd.stock )
    end
    @cart_items.destroy_all
    redirect_to cds_path
  else
    @user = current_user
    @addresses = @user.addresses
    @cart_items = current_user.cart_items
    @cd = @cart_items.first.cd
    @disk = @cd.disks.first
    @music = @disk.musics.first
    @artist = @music.artist
    render :index
  end
end

  def edit
  @order = Order.find(params[:id])
  end

  def update
  end

  def destroy
  end

  private

  def order_params
  params.require(:order).permit(:user_id, :address_id, :payment_method, :total_price)
  end



end
