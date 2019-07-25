class Administrator::OrdersController < ApplicationController

  def index
  @orders = Order.all
  end

  def show
  @orders = Order.all
  @order = Order.find(params[:id])
  end

  def edit
  end


end
