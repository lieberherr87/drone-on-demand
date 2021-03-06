module ApplicationHelper
  def chat_partner(user, conversation)
    (user.id == conversation.recipient.id) ? "#{conversation.sender.first_name} #{conversation.sender.last_name}" : "#{conversation.recipient.first_name} #{conversation.recipient.last_name}"
  end

  def chat_partner_object(user, conversation)
    (user.id == conversation.recipient.id) ? conversation.sender : conversation.recipient
  end
end
