class OrdersController < ApplicationController
  
  def show
    @order = Order.where(id: params[:id])
  end

end
