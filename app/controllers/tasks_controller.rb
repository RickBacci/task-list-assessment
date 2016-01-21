class TasksController < ApplicationController

  def index
    @task_lists = current_user.task_lists if current_user
  end

  def new
    @task_list = current_user.task_lists.where(id: params[:task_list])
    @task      = Task.new
  end

  private

  def task_params
    params.require(:task).permit(:status, :notes, :start, :due)
  end

end
