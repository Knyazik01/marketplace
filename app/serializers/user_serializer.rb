class UserSerializer < ActiveModel::Serializer
  attributes :id, :login, :phone, :full_name, :created_at

  def attributes(*args)
    data = super
    data.delete(:password_digest)
    data
  end
end
