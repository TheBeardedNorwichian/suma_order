class OrdersController < ApplicationController
  
  def show
    @order = Order.find(params[:id])
    @members = @order.group.users
    store_location
  end

  def new
    if current_user.group_admin == true
      @order = current_user.group.orders.build
    end
  end
  
  def create
    @order = current_user.group.orders.build(order_params)
    if @order.save
      flash[:success] = "New order created!"
      redirect_to group_path(@order.group)
    end
  end

  private

    def order_params
      params.require(:order).permit(:open, :deadline, :delivery, :group_id)
    end

end
