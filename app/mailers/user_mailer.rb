class UserMailer < ApplicationMailer
  default from: Rails.application.secrets.from_email

  def welcome_email(rent)
    @rent = rent
    @book = rent.book
    I18n.with_locale(rent.user.locale || :es) do
      mail(to: rent.user.email, subject: I18n.t('mails.welcome.subject')) do |format|
        format.html { render 'welcome_email' }
      end
    end
  end
end
