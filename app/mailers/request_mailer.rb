class RequestMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.request_mailer.request_created.subject
  #
  def request_created(request)
    @pilots = User.where(pilot:true)
    @request = request
    @greeting = "Hi"

    # mail(to: @pilots.email, subject: "Clients need your help: A new request has been created!")
  end
end
