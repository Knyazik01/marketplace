class Ad < ApplicationRecord
  # TODO add relations
  # main_image_id, category_id
  belongs_to :user
  has_many :favourite_ads # ad can be added to favourites
  has_many :comments
end
