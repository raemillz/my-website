class SessionsController < ApplicationController
  def new
      @admin = Admin.new
    end
  def create
    admin = Admin.authenticate!(params[:email], params[:password])
    if admin
      session[:admin_id] = admin.id
      redirect_to admin_path, notice: "You have been logged in!"
    else
      # flash.now[:error] = "Bad e-mail or password"
      # render :new

    flash[:error] = "Bad e-mail or password"
    redirect_to sessions_path
      # redirect_to sign_in_path, error: "Bad e-mail or password"
    end
  end

  def destroy
    session[:admin_id] = nil
    redirect_to root_path, notice: "You have been logged out!"
  end
end
