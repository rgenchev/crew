class User < ApplicationRecord
  has_secure_password

  belongs_to :team

  enum role: { user: 0, admin: 1 }

  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validates :name, presence: true
  validates :role, presence: true

  def username=(value)
    super(value&.downcase)
  end

  def to_param
    username
  end
end
