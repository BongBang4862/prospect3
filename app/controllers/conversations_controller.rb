class ConversationsController < ApplicationController
  def new
    @prospect = Prospect.find(params[:prospect_id])
    @conversation = Conversation.new
  end
  def create 
    @prospect = Prospect.find(params[:prospect_id])
    @conversations = Conversation.new(conversation_params)
    @conversations.prospect = @prospect
    @conversations.save
    redirect_to new_prospect_conversation_path(@prospect)
  end

  private
  def set_prospect
    @prospect = Prospect.find(params[:prospect_id])
  end

  def conversation_params
    params.require(:conversation).permit(:content)
  end
end
