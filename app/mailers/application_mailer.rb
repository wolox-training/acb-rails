# frozen_string_literal: true
class ApplicationMailer < ActionMailer::Base
  default from: 'from_email'
  layout 'mailer'
end
