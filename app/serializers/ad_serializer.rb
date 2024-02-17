class AdSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :price, :created_at, :user_id

  has_one :user
  # we can change field key using 'key:' param
  # , key: :author
  has_many :comments
end