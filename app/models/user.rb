class User < ApplicationRecord
  has_secure_password

  validates :username, presence: true, uniqueness: true



  def admin?
    is_admin? && !guest?
  end



  def guest?
    !persisted?
  end
end
