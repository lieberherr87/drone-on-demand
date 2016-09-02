class Message < ApplicationRecord
  belongs_to :conversation
    belongs_to :user

  validates_presence_of :body, :conversation_id, :user_id

  def message_time
    created_at.strftime("%d/%m/%y at %l:%M %p")
  end

  def set_to_read
    self.read = true
    self.save
  end

  def self.read
    where(read: true)
  end

  def self.unread
    where(read: false)
  end

end
