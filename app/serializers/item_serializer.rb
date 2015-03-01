class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :description, :avatar_url
end
