class OrderitemsController < ApplicationController
before_action :correct_user,    only: [:index]

# will only ever show the orderitmes for the active order
  def index 
    @user = User.find(params[:user_id])
    @order = active_order
    @user_orderitems = Orderitem.user_orderitems(@order, params[:user_id])
    store_location
  end

  def add_to_order
    @item_to_add = Orderitem.new(user_id: current_user.id, order_id: active_order.id, item_id: params[:item_id])
    @updated_oi = Orderitem.add_oi(@item_to_add)
    respond_to do |format|    
      if @updated_oi.save!
        format.html do
          flash[:success] = "One #{@updated_oi.item.description} added to your order."
          redirect_to session[:return_to]
        end
        format.js
      else 
        format.html do 
          flash[:error]
        end
        format.js
      end
    end
  end

  def destroy
    @item_to_remove = Orderitem.find(params[:id])
    @removed_oi = Orderitem.remove_oi(@item_to_remove)
    respond_to do |format|
      format.html do 
        flash[:warning] = "#{@removed_oi.item.description} removed"
        redirect_to session[:return_to]
      end
      format.js
    end
  end

  private

    def correct_user
      @user = User.find(params[:id] || params[:user_id])
      redirect_to(root_path) unless current_user?(@user)
    end

    def orderitem_params
      params.permit(:item_id)
    end

end