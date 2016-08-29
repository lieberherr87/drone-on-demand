class RequestMailer < ApplicationMailer
  def request_created
    request = Request.first
    UserMailer.request_created(request)
  end
end
