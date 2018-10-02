class EmailWorker
  include Sidekiq::Worker

  def perform(*args)
    rent = Rent.find(rent_id)
    I18n.locale = rent.user.locale
    UserMailer.welcome_email(rent).deliver
  end
end
