class AddSocialUrlToUserSwapTasks < ActiveRecord::Migration[8.0]
  def change
    add_column :user_swap_tasks, :social_url, :string
  end
end
