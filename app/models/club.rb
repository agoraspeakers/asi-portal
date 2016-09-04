class Club < ApplicationRecord
  include Workflow
  workflow_column :status
  workflow do
    state :requested do
      event :confirm, transitions_to: :confirmed
      event :refuse,  transitions_to: :rejected
    end
    state :confirmed do
      event :disband, transitions_to: :disbanded
    end
    state :disbanded do
      event :reanimate, transitions_to: :confirmed
    end
    state :rejected
  end
end
