class UpdateSwapMembersJob < ApplicationJob
    queue_as :default
  
    def perform
      service = GoogleSheetsService.new
  
      Swap.where.not(sheet_id: nil).find_each do |swap|
        emails = service.fetch_emails(swap.sheet_id)
  
        emails.each do |email|
          user = User.find_by(email: email)
          next unless user
          swap.users << user unless swap.users.include?(user)
        end
      end
    end
  end
  