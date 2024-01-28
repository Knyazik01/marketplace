class User < ApplicationRecord
  validates :login, presence: true, uniqueness: true
  has_secure_password
  has_many :ads
end
