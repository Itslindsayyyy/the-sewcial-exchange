class GroupMembership < ApplicationRecord
  belongs_to :user
  belongs_to :swap_group
end
