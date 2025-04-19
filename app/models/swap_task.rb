class SwapTask < ApplicationRecord
  belongs_to :swap
  has_many :user_swap_tasks, dependent: :destroy
  has_many :users, through: :user_swap_tasks  
end
