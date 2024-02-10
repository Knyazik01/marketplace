class AddIndexToFavouriteAds < ActiveRecord::Migration[7.1]
  def change
    add_index :favourite_ads, [:user_id, :ad_id], unique: true
  end
end
