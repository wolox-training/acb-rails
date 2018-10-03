class UserMailer < ApplicationMailer
  default from: Rails.application.secrets.default_email

  def welcome_email(rent)
    @rent = rent
    @book = rent.book
    mail(to: rent.user.email, default_i18n_subject(subject: 'Welcome to my kickoff proyect ')) do |format|
      format.html { render 'welcome_email' }
    end
  end
end
