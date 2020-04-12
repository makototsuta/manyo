class Task < ApplicationRecord
  validates :task_name,  presence: true, length: { maximum: 30 }
  validates :priority,  presence: true, length: { maximum: 10 }
  validates :status,  presence: true, length: { maximum: 10 }
  validates :user_name,  presence: true, length: { maximum: 30 }
end
