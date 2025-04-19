class RemoveAssignedToUserIdFromSwapTasks < ActiveRecord::Migration[8.0]
  def change
    remove_column :swap_tasks, :assigned_to_user_id, :integer
  end
end
