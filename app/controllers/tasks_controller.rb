class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy, :checkbox]

  # READ
  def index
    @tasks = Task.all
  end

  def show
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
  end

  def update
    @task.update(task_params)

    redirect_to tasks_path
  end

  def checkbox
    @task.completed = !@task.completed
    # Passes a "task" object to params which is an hash with 1 key-value pair
    # Otherwise params.require(:task) cannot read the object
    params[:task] = {completed: @task.completed}
    @task.update(task_params)

    redirect_to tasks_path
  end

  # DELETE
  def destroy
    @task.destroy

    redirect_to tasks_path
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  # security feature: makes sure only displayed form fields are passed in post body
  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
