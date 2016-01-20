class TasksController < ApplicationController
  def index
    @task_lists = current_user.task_lists if current_user
  end
end
