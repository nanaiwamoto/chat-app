class MessagesController < ApplicationController

  before_action :set_room, only: [:create]

  def create
    @message = @room.messages.new(message_params)
    if @message.save
      redirect_to @room
    else
      render 'new'
    end
  end

  private

  def set_room
    @room = Room.find(params[:room_id])
  end

  def message_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end
end