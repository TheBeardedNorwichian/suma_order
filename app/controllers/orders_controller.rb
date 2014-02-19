class OrdersController < ApplicationController
  
  def show
    @order = Order.find(params[:id])
    @members = @order.orderitems.users
    store_location
  end

  def new
    if current_user.admin == true
      @order = Order.new
    end
  end
  
  def create
    @order = Order.build(order_params)
    if @order.save
      flash[:success] = "New order created!"
      redirect_to orders_path
    end
  end

  private

    def order_params
      params.require(:order).permit(:open, :deadline, :delivery, :active_order)
    end

end
