module TasksHelper
  def task_status(task)
    return "Complete" if task.status
    "Incomplete"
  end

  def task_action(task)
    return "Incomplete" if task.status
    "Complete"
  end
end
