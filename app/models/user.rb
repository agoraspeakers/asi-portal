class User < ApplicationRecord
  # Include devise modules. Others available are: :omniauthable, :confirmable, :lockable, :timeoutable
  devise(
    :invitable, :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable
  )
  has_many :memberships
  has_many :club_requests, ->(){ where("memberships.status": "requested") }, class_name: "Club", through: :memberships, source: "club"
  has_many :clubs,         ->(){ where("memberships.status": "confirmed") }, class_name: "Club", through: :memberships, source: "club"
end
