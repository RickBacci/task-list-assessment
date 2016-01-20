class TaskListsController < ApplicationController
  def index
    @task_lists = current_user.task_lists if current_user
  end

  def new
    @task_list = current_user.task_lists.new
  end

  def create

    @task_list = current_user.task_lists.new(task_list_params)

    if @task_list.save
      flash[:success] = "TaskList successfully created"
      redirect_to task_lists_path
    else
      flash[:failure] = "There was a problem creating your TaskList"
      render :new
    end
  end

  private

  def task_list_params
    params.require(:task_list).permit(:title, :description)
  end

end
