class Kiosk < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable
  belongs_to :store
  validates_presence_of :store
  validates_presence_of :beacon_uuid
  validates_uniqueness_of :beacon_uuid, scope: :kiosk_id
end
