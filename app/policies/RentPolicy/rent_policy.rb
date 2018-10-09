class RentPolicy < ApplicationPolicy
  class Scope < RentPolicy
    def resolve
      if user.admin?
        scope.all
      else
        scope.where(user_id: user.id)
      end
    end
  end

  def index?
    user.id == record.user.id
  end

  def create?
    user.id == record.user.id
  end

  def update?
    user.id == record.user.id
  end

  def destroy?
    user.id == record.user.id
  end

  def admin?
    false
  end
end
