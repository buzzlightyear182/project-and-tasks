class ProjectsController < ApplicationController

  def index
    @projects = Project.all
    if params[:filter] != "See all" && params[:filter].present?
      @filter = params[:filter]
      @projects = @projects.select {|project| project.status == params[:filter]}
    end
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.create project_params
    redirect_to action: 'index'
  end

  private
  def project_params
    params.require(:project).permit(:name)
  end

end
