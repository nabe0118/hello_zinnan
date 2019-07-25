class Administrator::OrdersController < ApplicationController

  before_action :authenticate_admin!


  def index
  @orders = Order.all
  end

  def show
  @order = Order.find(params[:id])
  @order_details = @order.order_details
  end

  def edit
  @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
      flash[:notice] = "変更完了しました。"
    redirect_to administrator_order_path

  end

  private

    def order_params
      params.require(:order).permit(:status)
    end

end
