# frozen_string_literal: true

class EmailWorker
  include Sidekiq::Worker

  def perform(rent_id)
    UserMailer.welcome_email(Rent.find(rent_id)).deliver_now
  end
end
