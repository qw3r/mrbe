class Dog < ApplicationRecord
  belongs_to :user
  has_many :tricks, dependent: :destroy

  validates :name, presence: true
end
