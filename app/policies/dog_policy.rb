class DogPolicy < ApplicationPolicy
  def create?
    !user.guest?
  end
end
