# frozen_string_literal: true

module SolidusSubscriptions
  class Processor
    class << self
      def run
        SolidusSubscriptions::Subscription
          .where(installments: SolidusSubscriptions::Installment.actionable)
          .or(SolidusSubscriptions::Subscription.actionable)
          .distinct
          .find_each do |subscription|
            ProcessSubscriptionJob.perform_later(subscription)
          end
      end

      def run_reminders
        SolidusSubscriptions::Subscription
          .soon_actionable
          .find_each do |subscription|
          ProcessRemindersJob.perform_later(subscription)
        end
      end
    end
  end
end
