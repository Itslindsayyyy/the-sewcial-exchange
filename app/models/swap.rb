class Swap < ApplicationRecord
  belongs_to :swap_group
  belongs_to :host, class_name: "User", foreign_key: :created_by_id

  has_one_attached :image

  has_many :swap_tasks, dependent: :destroy, inverse_of: :swap
  has_many :group_memberships

  accepts_nested_attributes_for :swap_tasks, allow_destroy: true

  # Automatically set sheet_id from sheet_url if it's present
  before_validation :set_sheet_id_from_url

  private

  def set_sheet_id_from_url
    return if sheet_url.blank?
    self.sheet_id = extract_sheet_id_from_url(sheet_url)
  end

  def extract_sheet_id_from_url(url)
    url.match(/\/spreadsheets\/d\/(.*?)\//)[1]
  rescue
    nil
  end
end
