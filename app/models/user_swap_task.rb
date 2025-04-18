class UserSwapTask < ApplicationRecord
  belongs_to :user
  belongs_to :swap_task
end
