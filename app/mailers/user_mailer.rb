class UserMailer < ApplicationMailer
  default from: Rails.application.secrets.default_email

  def welcome_email(rent)
    @rent = rent
    @book = rent.book
    mail(to: rent.user.email, subject: I18n.t('mails.welcome.subject')) do |format|
      format.html { render 'welcome_email' }
    end
  end
end
