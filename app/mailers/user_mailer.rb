class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def welcome_client(user)
    logger.warn "UserMailer"
    @user = user
    @greeting = "Hi"

    mail(to: @user.email, subject: "Welcome to Droneit. Get started now!")
  end

  def welcome_pilot(user)
    @user = user
    @greeting = "Hi"

    mail(to: @user.email, subject: "Welcome to Droneit. Get started now!")
  end

end
