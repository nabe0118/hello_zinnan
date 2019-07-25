class Administrator::OrdersController < ApplicationController

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
    @order.update
      flash[:notice] = "編集完了しました。"
    redirect_to administrator_order_path
  end


end
