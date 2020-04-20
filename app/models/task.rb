class Task < ApplicationRecord
  validates :task_name,  presence: true, length: { maximum: 30 }
  validates :priority,  presence: true, length: { maximum: 10 }
  validates :status,  presence: true, length: { maximum: 10 }

  scope :get_by_task_name, ->(task_name) {
    where("task_name like ?", "%#{task_name}%")
  }
  scope :get_by_status, ->(status) {
    where(status: status)
  }

  enum priority:  [:'高', :'中', :'低']

  has_many :labellings, dependent: :destroy
  has_many :labels, through: :labellings
  belongs_to :user
end
