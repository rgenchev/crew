class UserPolicy < ApplicationPolicy
  def index?
    user.present?
  end

  def show?
    index?
  end
end
