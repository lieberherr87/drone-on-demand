class MessagesController < ApplicationController
  before_action :set_conversation

  def index
    @messages = @conversation.messages
    @message = @conversation.messages.new
  end

  def new
    @message = @conversation.messages.new
  end

  def create
    @message = @conversation.messages.new(message_params)
    if @message.body == ""
      flash.now[:notice] = "The message should not be empty".html_safe
    elsif @message.save
      redirect_to conversation_messages_path(@conversation)
    end
  end

  def destroy
  end

  private

  def set_conversation
   @conversation = Conversation.find(params[:conversation_id])
  end

  def message_params
    params.require(:message).permit(:body, :conversation_id, :user_id, :read)
  end
end
