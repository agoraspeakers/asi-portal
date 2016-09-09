class Club < ApplicationRecord
  include Workflow

  has_many :memberships
  has_many :membersip_requests, ->(){ where("memberships.status": "requested") }, class_name: "User", through: :memberships, source: "user"
  has_many :members,            ->(){ where("memberships.status": "confirmed") }, class_name: "User", through: :memberships, source: "user"

  workflow_column :status
  workflow do
    state :requested do
      event :confirm, transitions_to: :confirmed
    end
    state :confirmed
  end
  # President
  # Vice-president of Educatuion
  # Vice-president of Membership
  # Treasurer
  # Secretary
  # Vice-president of Marketing
  # Comiunity Manager
  # Meeting Facilitator
end
