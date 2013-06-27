class UsersController < ApplicationController
  before_action :correct_user,    only: [:edit, :update]
  before_action :admin_user,      only: [:index, :new, :create, :destroy]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
      @user = User.new(user_params)
      if @user.save
        flash[:success] = "#{@user.name} created!"
        redirect_to root_path
      else
        render 'new'
      end
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "All done - congratulations"
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def index
    @users = User.all
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "They dun gone."
    redirect_to users_url
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    # Before filters

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
end
