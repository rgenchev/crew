class AboutPolicy < Struct.new(:user, :about)
  def index?
    user.present?
  end
end
