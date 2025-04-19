class AddCreatedByToSwaps < ActiveRecord::Migration[8.0]
  def change
    add_column :swaps, :created_by_id, :integer
  end
end
