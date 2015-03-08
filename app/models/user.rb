class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable
  validates :name, presence: true, length: { maximum: 100 }
  validates_presence_of :points
  mount_uploader :avatar, AvatarUploader

  has_one :device

  def avatar_url
    avatar.url
  end

  def notify_kiosk(kiosk)
    msg = {
      resource: 'kiosk',
      user: self,
      kiosk: kiosk,
      status: 'success'
    }

    $redis.publish "rt-change", msg.to_json
  end

end
