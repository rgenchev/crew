class User < ApplicationRecord
  has_secure_password

  belongs_to :team

  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :name, presence: true
end
