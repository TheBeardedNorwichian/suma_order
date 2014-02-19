class OrderitemsController < ApplicationController

# will only ever show the orderitmes for the active order
  def index 
    @order = active_order
    @user_orderitems = Orderitem.user_orderitems(@order, params[:user_id])
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