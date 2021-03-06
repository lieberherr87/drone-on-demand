class RequestMailer < ApplicationMailer

  # default bcc: User.where(pilot:true).pluck(:email)

  def request_created(request)
    pilots = User.where(pilot:true)
    @request = request
    @greeting = "Hi"
    pilots.each do |pilot|
      mail(to: pilot.email, subject: "Clients need your help: A new request has been created!")
    end
  end
end
