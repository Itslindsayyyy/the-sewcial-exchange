# app/jobs/update_swap_members_job.rb
class UpdateSwapMembersJob < ApplicationJob
  queue_as :default

  def perform
    Rails.logger.info "Running UpdateSwapMembersJob at #{Time.now}"

    service = GoogleSheetsService.new

    Swap.where.not(sheet_id: nil).find_each do |swap|
      Rails.logger.info "Checking swap: #{swap.title} (#{swap.id})"

      emails = service.fetch_emails(swap.sheet_id)

      emails.each do |email|
        signup = SwapSignup.find_or_initialize_by(email: email.downcase, swap: swap)
      
        user = User.find_by(email: email)
        signup.user = user if user && signup.user.nil?
        signup.save!
      
        if user && !swap.users.include?(user)
          swap.users << user
          Rails.logger.info "Added #{user.email} to #{swap.title}"
        end
      end      
    end
  end
end
