class User < ApplicationRecord
  # Include devise modules. Others available are: :omniauthable, :confirmable, :lockable, :timeoutable
  devise(
    :invitable, :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable
  )
  has_many :memberships
  has_many :club_requests, ->(){ where("memberships.status": "requested") }, class_name: "Club", through: :memberships, source: "club"
  has_many :clubs,         ->(){ where("memberships.status": "confirmed") }, class_name: "Club", through: :memberships, source: "club"

  scope :with_location, ->(){ where("users.latitude IS NOT NULL AND users.longitude IS NOT NULL") }

  validates :name, presence: true

  after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }

  geocoded_by :address

  def formated_email
    "#{name} <#{email}>"
  end

  def geolocation
    "#{latitude},#{longitude}" if latitude && longitude
  end

  def geolocation_hash
    { lat: latitude, lng: longitude } if latitude && longitude
  end
end
