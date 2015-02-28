class Store < ActiveRecord::Base
  belongs_to :vendor
  validates_presence_of :address, length: { max: 500 }
  validates_presence_of :vendor
end
