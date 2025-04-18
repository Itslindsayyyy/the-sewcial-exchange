class CreateSwapGroups < ActiveRecord::Migration[8.0]
  def change
    create_table :swap_groups do |t|
      t.string :name
      t.text :description
      t.references :created_by, null: false, foreign_key: true

      t.timestamps
    end
  end
end
