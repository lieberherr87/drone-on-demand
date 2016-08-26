class ConversationsController < ApplicationController
  # before_action :authenticate_user

  def index
    @conversations = Conversation.where("recipient_id=#{current_user.id} OR sender_id=#{current_user.id}")
  end

  def create
    @conversation = Conversation.new
    if Conversation.between(params[:sender_id],params[:recipient_id]).present?
      @conversation = Conversation.between(params[:sender_id], params[:recipient_id]).first
    else
      @conversation = Conversation.create!(conversation_params)
    end
    redirect_to conversation_messages_path(@conversation)
  end

  # def destroy
  # end

  private

  def conversation_params
    params.permit(:recipient_id, :sender_id)
  end
end
