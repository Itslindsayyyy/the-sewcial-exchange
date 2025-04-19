class SwapSignup < ApplicationRecord
  belongs_to :swap
  belongs_to :user, optional: true

  validates :email, presence: true
end
