class User < ApplicationRecord
  has_secure_password

  belongs_to :company

  validates :username, presence: true, uniqueness: true
end
