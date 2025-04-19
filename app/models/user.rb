class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_one_attached :image

  has_many :user_roles
  has_many :roles, through: :user_roles
  has_many :created_swaps, class_name: "Swap", foreign_key: :created_by_id
  has_many :group_memberships
  has_many :swap_groups, through: :group_memberships

  has_many :swaps, through: :swap_groups
  has_many :swap_tasks, foreign_key: :assigned_to_user_id

  has_many :user_swap_tasks
  has_many :notifications
  has_many :feedback_forms
end
