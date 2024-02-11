class FavouriteAd < ApplicationRecord
  belongs_to :user
  belongs_to :ad
  # add uniqueness user + ad pair validation
  validates :ad_id, uniqueness: { scope: :user_id, message: 'User has already added this ad to favourite' }
  # Or we can use: validates_uniqueness_of :ad_id, :scope => :user_id
end
