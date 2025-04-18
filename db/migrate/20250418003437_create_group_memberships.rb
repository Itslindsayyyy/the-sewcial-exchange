class CreateGroupMemberships < ActiveRecord::Migration[8.0]
  def change
    create_table :group_memberships do |t|
      t.references :swap_group, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :group_role

      t.timestamps
    end
  end
end
