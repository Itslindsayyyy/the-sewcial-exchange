class CreateSwaps < ActiveRecord::Migration[8.0]
  def change
    create_table :swaps do |t|
      t.references :swap_group, null: false, foreign_key: true
      t.string :title
      t.string :theme
      t.datetime :deadline
      t.string :status
      t.text :rules

      t.timestamps
    end
  end
end
