class RequestMailer < ApplicationMailer

  default bcc: User.where(pilot:true).pluck(:email)

  def request_created(request)
    @request = request
    @greeting = "Hi"

    mail(subject: "Clients need your help: A new request has been created!")
  end
end
