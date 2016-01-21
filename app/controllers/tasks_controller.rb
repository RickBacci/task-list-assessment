class TasksController < ApplicationController

  def index
    @task_lists = current_user.task_lists if current_user
  end

  def new
    # @task_list = current_user.task_lists.find(params[:id])
    @task_list = current_user.task_lists.find(params[:task_list_id])
    @task = Task.new
  end

  def create
    # task_list = current_user.task_lists.where(id: params[:task_list])
    @task_list = current_user.task_lists.find(params[:id])
    require 'pry'; binding.pry
    @task = Task.create(task_params)
    # task_list << @task.save

    if @task.save
      flash[:success] = "TaskList successfully created"
      redirect_to task_list_tasks_path(task_list.id)
    else
      flash[:failure] = "There was a problem creating your TaskList"
      render :new
    end
  end

  private

  def task_params
    params.require(:task).permit(:status, :notes, :start, :due, :tasklist_id)
  end

end
