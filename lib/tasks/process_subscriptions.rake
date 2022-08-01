# frozen_string_literal: true

namespace :solidus_subscriptions do
  desc 'Create orders for actionable subscriptions'
  task process: :environment do
    SolidusSubscriptions::Processor.run
  end

  desc 'Sends out reminders to customers 72 hours prior to the actionable date'
  task reminders: :environment do
    SolidusSubscriptions::Processor.run_reminders
  end
end
