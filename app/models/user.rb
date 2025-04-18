class User < ApplicationRecord
  #rails built-in auth / enables password hashing and authentication
  has_secure_password
  
  has_many :user_roles
  has_many :roles, through: :user_roles

  has_many :group_memberships
  has_many :swap_groups, through: :group_memberships

  has_many :swaps, through: :swap_groups
  has_many :swap_tasks, foreign_key: :assigned_to_user_id

  has_many :user_swap_tasks
  has_many :notifications
  has_many :feedback_forms
end
