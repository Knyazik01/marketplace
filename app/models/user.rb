class User < ApplicationRecord
  validates :login, presence: true, uniqueness: true
  has_secure_password
  has_many :ads
  has_many :favourite_ads # user can has favourites ads
  has_many :comments
end
