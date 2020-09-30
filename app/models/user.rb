class User < ApplicationRecord
  validates :name, presence: true
  validates :username, presence: true
  validates :email, presence: true

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
end
