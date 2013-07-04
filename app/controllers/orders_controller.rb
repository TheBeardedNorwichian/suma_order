class OrdersController < ApplicationController

  def index
    @order = Group.find(params[:id]).orders
  end
  
  def show
    @order = Order.find(params[:id])
  end

end
