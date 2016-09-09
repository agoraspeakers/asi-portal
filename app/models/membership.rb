class Membership < ApplicationRecord
  include Workflow
  self.primary_keys = :user_id, :club_id

  belongs_to :user
  belongs_to :club

  workflow_column :status
  workflow do
    state :requested do
      event :confirm, transitions_to: :confirmed
    end
    state :confirmed
  end
end
