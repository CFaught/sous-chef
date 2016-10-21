class UserPolicy < ApplicationPolicy
  def show?
    record.try(:user) == user
  end
end
