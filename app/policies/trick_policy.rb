class TrickPolicy < ApplicationPolicy
  def create?
    update?
  end
end
