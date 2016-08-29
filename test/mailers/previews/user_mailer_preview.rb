class UserMailerPreview < ActionMailer::Preview
  def welcome
    user = User.first
    UserMailer.welcome_client(user)
  end
end
