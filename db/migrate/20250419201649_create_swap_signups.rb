class CreateSwapSignups < ActiveRecord::Migration[8.0]
  def change
    create_table :swap_signups do |t|
      t.string :email
      t.references :swap, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
