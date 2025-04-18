class Swap < ApplicationRecord
  belongs_to :swap_group
  has_many :swap_tasks
end
