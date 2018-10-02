class EmailWorker
  include Sidekiq::Worker

  def perform(*_args)
    rent = Rent.find(rent_id)
    UserMailer.welcome_email(rent).deliver
  end
end
