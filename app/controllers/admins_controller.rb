class AdminsController < ApplicationController
  before_action :set_user, only: [:show, :edit]

  def index
  end

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(admin_params)
    if @admin.save
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
    params.require(:admin).permit(:name, :email, :password))
  end
end
