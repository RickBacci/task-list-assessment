class TaskList < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true, uniqueness: true
end
