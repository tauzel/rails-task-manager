class TasksController < ApplicationController

  # READ
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  # CREATE
  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save

    redirect_to tasks_path
  end

  # UPDATE
  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)

    redirect_to tasks_path
  end

  # DELETE
  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    redirect_to tasks_path
  end

  private

  # security feature: makes sure only displayed form fields are passed in post body
  def task_params
    params.require(:task).permit(:title, :details)
  end
end
