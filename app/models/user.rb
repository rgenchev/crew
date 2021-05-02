class User < ApplicationRecord
  has_secure_password

  belongs_to :team

  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validates :name, presence: true

  def username=(value)
    super(value&.downcase)
  end
end
