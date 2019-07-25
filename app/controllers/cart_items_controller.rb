class CartItemsController < ApplicationController

  before_action :authenticate_user!
  before_action :correct_user, only:[:show, :index, :edit, :create, :update, :destroy]
  before_action :check_id, only:[:create]

  def correct_user
    redirect_to cds_path unless current_user
  end

  def check_id
      cart_items = current_user.cart_items
        cart_items.each do |cart|
          if cart.cd.id == params[:cd_id].to_i
            flash[:notice] = "既に同じ商品がカートに入っています"
            redirect_to cart_items_path
          end
        end
  end


  def new
    @cd = Cd.find(params[:cd_id])
    @cart_item = @cd.cart_items.build
  end

  def show
    @cart_item = CartItem.find(params[:id])
    @cd = @cart_item.cd
  end

  def index
    @user = current_user
    @cart_items = @user.cart_items
  end

  def edit
    @cart_item = CartItem.find(params[:id])
    @cd = @cart_item.cd
  end

  def create
    @cd = Cd.find(params[:cd_id])
    @cart_item = @cd.cart_items.build(cart_item_params)
    @cart_item.user_id = current_user.id
    if @cart_item.save
      redirect_to root_path
    end
  end

  def update
      @cart_item = CartItem.find(params[:id])
      if @cart_item.update(cart_item_params)
        redirect_to cart_item_path(@cart_item.id)
      else
        @cd = @cart_item.cd
        render :edit
      end
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:number, :cd_id, :user_id)
  end

end
