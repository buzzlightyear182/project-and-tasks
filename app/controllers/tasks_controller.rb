require 'pry'
class TasksController < ApplicationController

  # def index
  #   @tasks = Task.all
  # end

  def new
    @project = Project.find(params[:project_id])
    @task = Task.new
    @form_name = "Save!"
  end

  def create
    @project = Project.find(params[:project_id])
    @task = @project.tasks.create task_params
    redirect_to action: 'index', controller: 'projects'
  end

  def edit
    @project = Project.find(params[:project_id])
    @task = Task.find(params[:id])
    @form_name = "Update!"
    render 'new'
  end

  def update
    @task = Task.find(params[:id])
    @task.update_attributes(task_params)
    redirect_to action: 'index', controller: 'projects'
  end

  private
  def task_params
    params.require(:task).permit(:project_id, :name, :status)
  end

end
