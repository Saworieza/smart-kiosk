class StoreSerializer < ActiveModel::Serializer
  attributes :id, :address
  has_one :vendor
end
