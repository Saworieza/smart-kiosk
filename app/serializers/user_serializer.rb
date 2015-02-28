class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :avatar, :avatar_url, :points, :level
end
