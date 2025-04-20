class Swap < ApplicationRecord
  belongs_to :swap_group, optional: true
  belongs_to :host, class_name: "User", foreign_key: :created_by_id

  has_one_attached :image

  has_many :swap_tasks, dependent: :destroy
  has_many :group_memberships
  has_many :swap_signups, dependent: :destroy


  accepts_nested_attributes_for :swap_tasks, allow_destroy: true

  VALID_SHEET_URL_REGEX = /\Ahttps:\/\/docs\.google\.com\/spreadsheets\/d\/[a-zA-Z0-9_-]+\//

validates :sheet_url, format: {
  with: VALID_SHEET_URL_REGEX,
  message: "must be a valid Google Sheet link (starting with https://docs.google.com/spreadsheets/d/...)"
}, allow_blank: true

  # Automatically set sheet_id from sheet_url if it's present
  before_validation :set_sheet_id_from_url

  private

  def set_sheet_id_from_url
    return if self.sheet_url.blank?
    self.sheet_id = extract_sheet_id_from_url(self.sheet_url)
  end


  def extract_sheet_id_from_url(url)
    url.match(/\/spreadsheets\/d\/(.*?)\//)[1]
  rescue
    nil
  end
end
