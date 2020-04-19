class User < ApplicationRecord
  before_destroy :before_destroy_action

  validates :name,  presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  before_validation { email.downcase! }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
  has_many :tasks, dependent: :destroy

  private

  def before_destroy_action
    if self.admin? && User.where(admin: :true).count == 1
      throw :abort, notice: "管理者アカウントが最低1つ必要です"
    end
  end
end
