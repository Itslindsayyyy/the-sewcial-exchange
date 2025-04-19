class AddSheetUrlToSwaps < ActiveRecord::Migration[8.0]
  def change
    add_column :swaps, :sheet_url, :string
  end
end
