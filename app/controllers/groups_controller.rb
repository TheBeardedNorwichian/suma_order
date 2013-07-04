class GroupsController < ApplicationController
  before_action :admin_user,      only: [:index, :edit, :new, :create, :update, :destroy]

  def index
    @groups = Group.all
  end

  def show
    @group = Group.find_by_id(params[:id])
    @current_order = @group.current_order
    orders = @group.orders
    current_order_array = []
    current_order_array << @current_order
    @older_orders = orders - current_order_array
  end
  
  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      flash[:success] = "#{@group.name} created!"
      redirect_to new_group_path
    else
      render 'new'
    end
  end


  private

    def group_params
      params.require(:group).permit(:name)
    end

    # Before filters

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
end
