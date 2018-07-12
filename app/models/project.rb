class Project < ApplicationRecord
  belongs_to :user

  def index
    @projects = project
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @pet.save
      redirect_to project_path
    else
      render :new
    end
  end

  def show
    @project = Project.find(params[:id])
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    @project.update(project_params)
    redirect_to @project
  end

  private
  def project_params
    params.require(:project).permit(:name, :description, :github, :projecturl, :user_id)
  end

end
