class CommentSerializer < ActiveModel::Serializer
  attributes :id, :text, :user_id, :ad_id
  has_one :user
  has_one :ad
end
