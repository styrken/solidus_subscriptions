# frozen_string_literal: true

module SolidusSubscriptions
  class UpcomingRenewalMailer < ::Spree::BaseMailer
    def upcoming_renewal(subscription)
      @subscription = subscription
      @user = subscription.user
      @store = subscription.store

      mail(to: @user.email,
           subject: 'Renewal Notice',
           from: from_address(@store))
    end
  end
end
