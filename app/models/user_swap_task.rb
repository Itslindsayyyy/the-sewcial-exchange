class UserSwapTask < ApplicationRecord
  belongs_to :user
  belongs_to :swap_task
  belongs_to :assigned_to_user, class_name: "User", optional: true

  validates :social_url, format: URI::DEFAULT_PARSER.make_regexp(%w[http https]), allow_blank: true
end
