class Kiosk < ActiveRecord::Base
  belongs_to :store
  belongs_to :vendor
  validates_presence_of :store
  validates_presence_of :vendor
  validates_presence_of :beacon_uuid
  validates_uniqueness_of :beacon_uuid
  validates_presence_of :unique_id
  validates_uniqueness_of :unique_id
  validates_presence_of :password
end
