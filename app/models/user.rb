class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable
  validates :name, presence: true, length: { maximum: 100 }
  validates_presence_of :points
  validates_presence_of :level
  mount_uploader :avatar, AvatarUploader

  enum level: {
    first_time: 0,
    occassional: 1,
    regular: 2,
    important: 3
  }

  def avatar_url
    avatar.url
  end

end
