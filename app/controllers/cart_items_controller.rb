class CartItemsController < ApplicationController
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
    else
      render :new
    end
  end

  def update
      @cart_item = CartItem.find(params[:id])
      if @cart_item.update(cart_item_params)
        redirect_to cart_item_path(@cart_item.id)
      else
        render :edit
      end
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to root_path
  end

  private
# :user_id
  def cart_item_params
    params.require(:cart_item).permit(:number, :cd_id, :user_id)
  end

end
