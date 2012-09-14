class MessagesController < ApplicationController
  def create
    @message = Message.new(params[:message])
    @message.sender = current_user
    @message.recipient = User.find(params[:recipient_id]) unless params[:recipient_id].blank?
    
    puts "\n\n\n\nMESSAGE sender: " + @message.sender.id.to_s + " - recipient: " + @message.recipient.id.to_s + "\n\n\n\n"
    @message.save!
    redirect_to :back
  end
  
end
