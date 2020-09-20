class MessagesController < ApplicationController

  def index
    @message = Message.new
    @room = Room.find(params[:room_id])
    @messages = @room.messages.includes(:user)
  end
  
  def create
    @room = Room.find(params[:room_id])
    # @message = Message.new(message_params)
    @message = @room.messages.new(message_params)
    # binding.pry
    if @message.save
      # recirect_to room_messages_path(room)
      redirect_to room_messages_path(@room)
    else
      @messages = @room.messages.includes(:user)
      render :index
    end
  end

  private

  def message_params
    # params.require(:message).permit(:content)
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end

end
