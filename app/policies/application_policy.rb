class ApplicationPolicy
  attr_reader :user, :record



  def initialize(user, record)
    @user = user
    @record = record
  end



  def index?
    true
  end



  def show?
    true
  end



  def create?
    false
  end



  def update?
    return false if user.guest?

    user.admin? || owner?
  end



  def destroy?
    update?
  end



  private

  def owner?
    record.user == user
  end
end