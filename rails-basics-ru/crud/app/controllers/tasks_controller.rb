class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:notice] = 'Task was successfully created'
      redirect_to @task
    else
      flash.now[:alert] = 'Failed to create the task'
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      flash[:notice] = 'Task was successfully updated'
      redirect_to @task
    else
      flash.now[:alert] = 'Failed to update the task'
      render :edit
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    flash[:notice] = 'Task was successfully deleted'
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:name, :description, :status, :creator, :performer, :completed)
  end
end
