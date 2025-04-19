class FixCreatedByForeignKeyOnSwapGroups < ActiveRecord::Migration[8.0]
  def change
    remove_foreign_key :swap_groups, column: :created_by_id
    add_foreign_key :swap_groups, :users, column: :created_by_id
  end
end
