class TasksController < ApplicationController

  def index
    @task_lists = current_user.task_lists if current_user
  end

  def new
    @task_list = current_user.task_lists.find(params[:task_list_id])
    @task = @task_list.tasks.new
  end

  def create
    @task_list = current_user.task_lists.find(params[:task_list_id])
    @task = @task_list.tasks.create(task_params)

    if @task.save
      flash[:success] = "Task successfully created"
      redirect_to task_list_tasks_path(@task_list)
    else
      flash[:failure] = "There was a problem creating your Task"
      render :new
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :status, :notes, :start, :due, :tasklist_id)
  end

end
