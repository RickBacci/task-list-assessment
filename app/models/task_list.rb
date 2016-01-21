class TaskList < ActiveRecord::Base
  has_many :tasks
  belongs_to :user

  validates :title, presence: true, uniqueness: true
end
