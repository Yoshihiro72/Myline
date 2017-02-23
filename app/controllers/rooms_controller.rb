class RoomsController < ApplicationController
  def index
    @message = Message.new
    @user = User.find(current_user.id)
    room_ids = JSON.parse(@user.rooms)
    @rooms = []
    room_ids.each do |id|
      @rooms.push(Room.find(id.to_i))
    end
    @room = @rooms[0]
    @logs = Message.where("room_id = #{@room[:id]}")
    render :action => "show/#{@room.id}"
  end

  def show
    @message = Message.new
    @user = User.find(current_user.id)
    @room = Room.find(params[:id])
    room_ids = JSON.parse(@user.rooms)
    @rooms = []
    room_ids.each do |id|
      @rooms.push(Room.find(id.to_i))
    end
    @logs = Message.where("room_id = #{@room[:id]}")
  end

  def send_message
    @message = Message.new(message_params)
    @message.save!
    @logs = Message.where("room_id = #{message_params[:room_id]}")
  end

  private

  def message_params
    params.require(:message).permit(:room_id, :sender_id, :text)
  end
end
