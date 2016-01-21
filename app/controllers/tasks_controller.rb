class TasksController < ApplicationController

  def index
    @task_lists = current_user.task_lists if current_user
  end

  def new
    @task_list = current_user.task_lists.find(params[:task_list_id])
    @task = Task.new
  end
  end

  private

  def task_params
    params.require(:task).permit(:status, :notes, :start, :due, :tasklist_id)
  end

end
