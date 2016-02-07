class Trick < ApplicationRecord
  belongs_to :dog

  validates :name, presence: true
end
