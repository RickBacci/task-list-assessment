class Task < ActiveRecord::Base
  has_many :task_lists

  enum status: [:incomplete, :complete]

  validates :title, presence: true
  validate :start_date_cannot_be_in_the_past,
    :due_date_cannot_be_in_the_past,
    :due_date_must_be_after_start_date


  def start_date_cannot_be_in_the_past
    if start < Date.today
      errors.add(:start, "can't be in the past")
    end
  end

  def due_date_cannot_be_in_the_past
    if due < Date.today
      errors.add(:due, "can't be in the past")
    end
  end

  def due_date_must_be_after_start_date
    if due.present? && start.present? && due < start
      errors.add(:due, "can't be before the start date")
    end
  end
end



