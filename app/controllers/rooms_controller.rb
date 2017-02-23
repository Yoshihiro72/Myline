class RoomsController < ApplicationController
  def show
    user = User.find(current_user.id)
    room_ids = JSON.parse(user.rooms)
    @rooms = []
    room_ids.each do |id|
      @rooms.push(Room.find(id.to_i))
    end
    @message = Message.new
  end

  def send_message

  end
end
