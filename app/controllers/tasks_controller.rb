class TasksController < ApplicationController

  # def index
  #   @tasks = Task.all
  # end

  def new
    @project = Project.find(params[:project_id])
    @task = Task.new
  end

  def create
    @project = Project.find(params[:project_id])
    @task = @project.tasks.create task_params
    redirect_to action: 'index', controller: 'projects'
  end

  private
  def task_params
    params.require(:task).permit(:name, :status)
  end

end