class SwapTask < ApplicationRecord
  belongs_to :swap
  belongs_to :assigned_to_user, class_name: "User"
  has_many :user_swap_tasks
end
