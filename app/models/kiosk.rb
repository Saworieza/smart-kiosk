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

  has_secure_password

  def self.authenticate_kiosk(unique_id, password)
    kiosk = find_by_unique_id(unique_id)
    return kiosk if kiosk && kiosk.authenticate(password)
  end

end
