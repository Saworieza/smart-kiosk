class DeviceSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :token, :enabled, :platform
end
