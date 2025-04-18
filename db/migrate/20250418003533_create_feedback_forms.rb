class CreateFeedbackForms < ActiveRecord::Migration[8.0]
  def change
    create_table :feedback_forms do |t|
      t.references :user, null: false, foreign_key: true
      t.string :category
      t.text :message
      t.datetime :submitted_at

      t.timestamps
    end
  end
end
