# TODO check if we need it (? add user serializer: only id + name)
class FavouriteAdSerializer < ActiveModel::Serializer
  attributes :id
  has_one :user
  has_one :ad
end
