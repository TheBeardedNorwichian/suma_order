class OrderitemsController < ApplicationController

  def index 
    @orderitems = Orderitem.where("order_id = ?", params[:order_id]).where("user_id = ?", params[:user_id])
    @order = Order.where(id: params[:order_id])
    store_location
  end

  def create
    @orderitem = Orderitem.create!(orderitem_params)
    flash[:success] = "#{@orderitem.item.description} added to your order!"
    redirect_to session[:return_to]
  end

  def destroy
    Orderitem.find(params[:id]).destroy
    flash[:success] = "They dun gone."
    redirect_to session[:return_to]
  end


  private

    def orderitem_params
      params.permit(:user_id, :order_id, :item_id)
    end

end