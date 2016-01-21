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
      flash[:success] = "Task successfully created!"
      redirect_to task_list_path(@task_list)
    else
      flash[:failure] = "There was a problem creating your Task!"
      render :new
    end
  end

  def edit
    @task_list = current_user.task_lists.find(params[:task_list_id])
    @task = @task_list.tasks.find(params[:id])
  end

  def update
    @task_list = current_user.task_lists.find(params[:task_list_id])
    @task = @task_list.tasks.find(params[:id])

    if @task.update(task_params)
      flash[:success] = "Task successfully updated!"
      redirect_to task_list_path(@task_list)
    else
      flash[:failure] = "Task update unsuccessful!"
      render :new
    end
  end

  def destroy
    current_user.task_lists.find(params[:task_list_id]).tasks.find(params[:id]).destroy
    flash[:success] = "Task deleted!"
    redirect_to task_list_path(params[:task_list_id])
  end

  def update_status
    @task_list = current_user.task_lists.find(params[:tasklist_id])
    @task = @task_list.tasks.find(params[:task_id])

    @task.update(status: toggle_task_status(@task))
    redirect_to task_list_path(@task_list)
  end

  private

  def toggle_task_status(task)
    if task.incomplete?
      task.complete!
    else
      task.incomplete!
    end
    return task.status
  end


  def task_params
    params.require(:task).permit(:title, :status, :notes, :start, :due, :tasklist_id)
  end

end
