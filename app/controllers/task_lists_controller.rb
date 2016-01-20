class TaskListsController < ApplicationController
  def index
  end

  def new
    @task_list = TaskList.new
  end

  def create
    @task_list = current_user.task_lists.new(tasklist_params)

    if @task_list
      flash[:success] = "TaskList successfully created"
      redirect_to tasks_path
    else
      flash[:failure] = "There was a problem creating your TaskList"
      render :new
    end
  end

  private

  def tasklist_params
    params.require(:task_list).permit(:new, :create)
  end

end
