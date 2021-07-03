class My::UserPolicy < ApplicationPolicy
  def update?
    user.present? && user.id == record.id
  end

  def edit?
    update?
  end
end
