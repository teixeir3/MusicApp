class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.activation_email.subject
  #
  def activation_email
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
