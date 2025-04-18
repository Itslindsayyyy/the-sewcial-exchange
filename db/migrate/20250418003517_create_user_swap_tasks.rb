class CreateUserSwapTasks < ActiveRecord::Migration[8.0]
  def change
    create_table :user_swap_tasks do |t|
      t.references :user, null: false, foreign_key: true
      t.references :swap_task, null: false, foreign_key: true
      t.boolean :completed

      t.timestamps
    end
  end
end
