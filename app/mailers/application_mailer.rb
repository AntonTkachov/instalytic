# frozen_string_literal: true

# ActionMailer::Base is a basic mailer class from rails
class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'
end
