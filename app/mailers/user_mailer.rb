class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.activation_email.subject
  #
  def initial_activation_email(user)
    @user = user
    mail(to: user.email, subject: "Welcome to Tommy's Cars! Please activate your account.")
  end
end
