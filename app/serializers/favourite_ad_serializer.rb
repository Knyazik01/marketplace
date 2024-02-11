class FavouriteAdSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :ad_id
  has_one :user # digest fields filtered automatically
  has_one :ad
end
