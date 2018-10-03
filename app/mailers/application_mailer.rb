class ApplicationMailer < ActionMailer::Base
  default from: 'from@email'
  layout 'mailer'
end
