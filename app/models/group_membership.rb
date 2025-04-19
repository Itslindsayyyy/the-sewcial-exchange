class GroupMembership < ApplicationRecord
  belongs_to :swap_group
  belongs_to :user
end
