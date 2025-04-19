require 'google_drive'

class GoogleSheetsService
  def initialize
    @session = GoogleDrive::Session.from_service_account_key("config/google_service_account.json")
  end

  def fetch_emails(sheet_id)
    sheet = @session.spreadsheet_by_key(sheet_id).worksheets.first
    email_col_index = sheet.rows.first.find_index { |header| header.strip.casecmp("email") == 0 }
    return [] unless email_col_index

    sheet.rows.drop(1).map { |row| row[email_col_index]&.strip&.downcase }.compact.uniq
  end
end
