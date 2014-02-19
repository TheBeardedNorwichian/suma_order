class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_to root_path
      flash[:success] = "Welcome back, #{user.name}"
    else
      flash.now[:error] = "Invalid email/password combination is wrong"
      render 'new'
    end    
  end

  def destroy
    sign_out
    redirect_to root_url
    flash[:success] = "Thank you for stopping by - hope you come again soon."
  end

end
