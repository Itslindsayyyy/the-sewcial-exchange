class SwapGroup < ApplicationRecord
  belongs_to :created_by, class_name: "User"

  has_many :group_memberships
  has_many :users, through: :group_memberships

  has_many :swaps
end
