class Vendor < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :confirmable, :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true, length: { maximum: 100 }
  mount_uploader :avatar, AvatarUploader

  has_many :stores
  has_many :kiosks
  has_many :items

end
