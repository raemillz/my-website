class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.authenticate!(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
    flash[:error] = "Bad e-mail or password"
    redirect_to sessions_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "You have been logged out!"
  end
end
