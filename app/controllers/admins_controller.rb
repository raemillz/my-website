class AdminsController < ApplicationController
  def index
    @admins = admin
  end

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(admin_params)
    if @pet.save
      redirect_to admin_path
    else
      render :new
    end
  end

  def show
    @admin = Admin.find(params[:id])
  end

  def edit
    @admin = Admin.find(params[:id])
  end

  def update
    @admin = Admin.find(params[:id])
    @admin.update(admin_params)
    redirect_to @admin
  end

  private
  def admin_params
    params.require(:admin).permit(:name, :password, :password_confirmation)
  end
end
