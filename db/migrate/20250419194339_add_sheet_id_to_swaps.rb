class AddSheetIdToSwaps < ActiveRecord::Migration[8.0]
  def change
    add_column :swaps, :sheet_id, :string
  end
end
