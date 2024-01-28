class AddUserRefToAds < ActiveRecord::Migration[7.1]
  def change
    add_reference :ads, :user, null: true, foreign_key: true
  end
end
