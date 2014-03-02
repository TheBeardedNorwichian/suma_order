class OrderitemsController < ApplicationController

# will only ever show the orderitmes for the active order
  def index 
    @order = active_order
    @user_orderitems = Orderitem.user_orderitems(@order, params[:user_id])
    store_location
  end

  def add_to_order
    @item_to_add = Orderitem.new(user_id: current_user.id, order_id: active_order.id, item_id: params[:item_id])
    @updated_oi = Orderitem.add_oi(@item_to_add)
    @updated_oi.save
    respond_to do |format|
      format.html do
        flash[:success] = "One #{@updated_oi.item.description} added to your order."
        redirect_to session[:return_to]
      end
      format.js
    end
  end

  def destroy
    @item_to_remove = Orderitem.find(params[:id])
    @removed_item = Orderitem.remove_oi(@item_to_remove)
    respond_to do |format|
      format.html do 
        flash[:warning] = "#{@removed_item.item.description} removed"
        redirect_to session[:return_to]
      end
      format.js
    end
  end


  private

    def orderitem_params
      params.permit(:item_id)
    end

end