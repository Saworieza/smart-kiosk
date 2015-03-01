class Item < ActiveRecord::Base
  belongs_to :vendor

  validates_presence_of :name
  validates_presence_of :number_of_items
  validates_presence_of :vendor
  validates_presence_of :price

  mount_uploader :avatar, AvatarUploader

  def avatar_url
    avatar.url
  end

end
