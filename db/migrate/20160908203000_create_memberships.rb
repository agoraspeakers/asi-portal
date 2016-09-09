class CreateMemberships < ActiveRecord::Migration[5.0]
  def change
    create_table :memberships, id: false do |t|
      t.string :status, default: "requested"
      t.references :user, foreign_key: true
      t.references :club, foreign_key: true

      t.timestamps
    end

    add_index :memberships, [:user_id, :club_id]
  end
end
