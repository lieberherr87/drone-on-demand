class MessagesController < ApplicationController
  before_action :set_conversation
  # after_action :set_to_read, only: [:index]

  def index
    # @messages = @conversation.messages
    @messages2 =  Message.where(conversation_id:@conversation.id)
    @message = @conversation.messages.new(conversation_id:params[:conversation_id], user_id:current_user.id)

    @messages2.each do |message|
      if message.user_id != current_user.id
        message.set_to_read
      end
    end
  end

  def new
    @message = @conversation.messages.new
  end

  def create
    @message = @conversation.messages.new(message_params)
    if @message.save
      redirect_to conversation_messages_path(@conversation)
    else
      @conversation = Conversation.find(params[:conversation_id])
      @messages = @conversation.messages
      render :index
    end
  end

  private

  def set_conversation
  @conversation = Conversation.find(params[:conversation_id])
    unless @conversation.belongs_to(current_user)
      redirect_to root_path
    end
  end

  def message_params
    params.require(:message).permit(:body, :conversation_id, :user_id, :read)
  end
end
