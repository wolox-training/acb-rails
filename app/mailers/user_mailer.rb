class UserMailer < ApplicationMailer
  default from: 'agustin.bajo@wolox.com.ar'

  def welcome_email(rent)
    @rent = rent
    @book = rent.book
    mail(to: rent.user.email, subject: 'Welcome to my kickoff proyect ') do |format|
      format.html { render 'welcome_email' }
    end
  end
end
