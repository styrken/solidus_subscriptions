# frozen_string_literal: true

module SolidusSubscriptions
  class ProcessRemindersJob < ApplicationJob
    queue_as { SolidusSubscriptions.configuration.processing_queue }

    def perform(subscription)
      ::SolidusSubscriptions::UpcomingRenewalMailer.upcoming_renewal(subscription).deliver_now
    end
  end
end
