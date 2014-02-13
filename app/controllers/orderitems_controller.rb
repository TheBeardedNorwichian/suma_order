class OrderitemsController < ApplicationController

  def index 
    @user_orderitems = Orderitem.user_orderitems(params[:order_id], params[:user_id])
    @order = Order.where(id: params[:order_id])
    store_location
  end

  def create
    @item_to_add = Orderitem.new(orderitem_params)
    @updated_oi = Orderitem.add_oi(@item_to_add)
    if @updated_oi.save
      flash[:success] = "One #{@updated_oi.item.description} added to your order."
      redirect_to session[:return_to]
    end
  end

  def destroy
    @item_to_remove = Orderitem.find(params[:id])
    Orderitem.remove_oi(@item_to_remove)
    flash[:warning] = "#{@item_to_remove.item.description} removed"
    redirect_to session[:return_to]
  end


  private

    def orderitem_params
      params.permit(:user_id, :order_id, :item_id, :quantity)
    end

end