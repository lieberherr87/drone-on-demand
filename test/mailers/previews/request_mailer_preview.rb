class RequestMailerPreview < ActionMailer::Preview
  def request_created
    request = Request.first
    RequestMailer.request_created(request)
  end
end
