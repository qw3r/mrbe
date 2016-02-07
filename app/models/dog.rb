class Dog < ApplicationRecord
  belongs_to :user
  has_many :tricks

  validates :name, presence: true
end
