class TaskListsController < ApplicationController
  def index
  end

  def new
    @tasklist = TaskList.new
  end

  def create
  end
end
