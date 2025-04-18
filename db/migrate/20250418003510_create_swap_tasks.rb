class CreateSwapTasks < ActiveRecord::Migration[8.0]
  def change
    create_table :swap_tasks do |t|
      t.references :swap, null: false, foreign_key: true
      t.string :task_name
      t.date :due_date
      t.references :assigned_to_user, null: false, foreign_key: true
      t.boolean :completed

      t.timestamps
    end
  end
end
