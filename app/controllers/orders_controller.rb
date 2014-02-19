class OrdersController < ApplicationController
  
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @orderitems = Orderitem.where(order_id: params[:id]).order(:user_id)
    @members = @order.users.distinct
    store_location
  end

  def new
    if current_user.admin == true
      @order = Order.new
    end
  end
  
  def create
    @order = Order.create!(order_params)
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
