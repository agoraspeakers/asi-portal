class AddRoleToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :role, :string, default: "user"
    reversible do |dir|
      dir.up do
        first = User.first
        first.update_attributes!(role: "admin") if first
        User.where(role: nil).update_all(role: "user")
      end
    end
  end
end
