class OrderitemsController < ApplicationController

  def index 
    @orderitems = Orderitem.user_orderitems(params[:order_id], params[:user_id])
    @order = Order.where(id: params[:order_id])
    store_location
  end

  # def create
  #   @orderitem = Orderitem.create!(orderitem_params)
  #   flash[:success] = "#{@orderitem.item.description} added to your order!"
  #   redirect_to session[:return_to]
  # end

  def create
    @item_to_add = Orderitem.new(orderitem_params)
    Orderitem.new_oi(@item_to_add)
    flash[:success] = "#{@item_to_add.item.description} added to your order!"
    redirect_to session[:return_to]
  end

  def destroy
    @item_to_remove = Orderitem.find(params[:id])
    Orderitem.remove_oi(@item_to_remove)
    flash[:success] = "They dun gone."
    redirect_to session[:return_to]
  end


  private

    def orderitem_params
      params.permit(:user_id, :order_id, :item_id, :quantity)
    end

end