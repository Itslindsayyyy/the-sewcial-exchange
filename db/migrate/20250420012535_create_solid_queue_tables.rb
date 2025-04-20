class CreateSolidQueueTables < ActiveRecord::Migration[7.1]
  def change
    create_table :solid_queue_jobs do |t|
      t.string :queue_name, null: false
      t.string :job_class, null: false
      t.jsonb :arguments, default: [], null: false
      t.datetime :scheduled_at
      t.datetime :started_at
      t.datetime :finished_at
      t.datetime :discarded_at
      t.datetime :retried_at
      t.integer :attempts, default: 0, null: false
      t.integer :priority, default: 0, null: false
      t.string :state, null: false, default: "queued"
      t.timestamps
    end

    add_index :solid_queue_jobs, :queue_name
    add_index :solid_queue_jobs, :state
    add_index :solid_queue_jobs, :scheduled_at
  end
end
