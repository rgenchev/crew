class SessionPolicy < Struct.new(:user, :session)
  def destroy?
    user.present?
  end
end
