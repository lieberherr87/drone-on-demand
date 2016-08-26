module ApplicationHelper
  def chat_partner(user, conversation)
    (user.id == conversation.recipient.id) ? conversation.sender.first_name : conversation.recipient.first_name
  end
end
