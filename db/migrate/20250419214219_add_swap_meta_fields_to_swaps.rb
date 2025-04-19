class AddSwapMetaFieldsToSwaps < ActiveRecord::Migration[8.0]
  def change
    add_column :swaps, :start_date, :date
    add_column :swaps, :shipping_deadline, :date
    add_column :swaps, :hashtag_1, :string
    add_column :swaps, :hashtag_2, :string
    add_column :swaps, :hashtag_3, :string
  end
end
