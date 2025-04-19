class ChangeSwapGroupIdToBeNullableInSwaps < ActiveRecord::Migration[8.0]
  def change
    change_column_null :swaps, :swap_group_id, true
  end
end
