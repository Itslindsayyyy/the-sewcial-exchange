require_relative "../config/boot"
require_relative "../config/environment"
require "clockwork"

module Clockwork
  every(2.minutes, "Update Swap Members") do
    UpdateSwapMembersJob.perform_later
  end
end
