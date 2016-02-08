class Trick < ApplicationRecord
  belongs_to :dog
  delegate :user, to: :dog

  validates :name, presence: true
end
