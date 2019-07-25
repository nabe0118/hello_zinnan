class OrdersController < ApplicationController

  before_action :authenticate_user!
  before_action :check_carts, only:[:index, :create]
  before_action :check_stock, only:[:create]

  def check_carts
    unless current_user.cart_items.exists?
      flash[:notice] ="カートに入っている商品がありません"
    redirect_to cds_path
    end
  end

  def check_stock
    carts = current_user.cart_items
    carts.each do |cart|
      if cart.number > cart.cd.stock
        flash[:notice] = "申し訳ございません。在庫がありません。"
        redirect_to cart_items_path
      end
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
  @user = User.find(params[:id])
  @orders = current_user.orders
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
        @order_detail = @order.order_details.build
          @order_detail.cd_id = cart.cd.id
          @order_detail.uni_price = cart.cd.price
          @order_detail.number = cart.number
          @order_detail.save
      end
      @cart_items.destroy_all
      cds = Cd.where( stock: 0 )
      cds.update_all( status: 1)
      redirect_to cds_path
    else
      @user = current_user
      @addresses = @user.addresses
      @cart_items = current_user.cart_items
      @cd = @cart_items.first.cd
      @disk = @cd.disks.first
      @music = @disk.musics.first
      @artist = @music.artist
      flash[:notice] = "購入ありがとうございました。"
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
