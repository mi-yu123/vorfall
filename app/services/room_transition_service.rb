class RoomTransitionService
  include GameConstants

  def initialize(current_room)
    @current_room = current_room
  end

  def available_choices
    CHOICES[@current_room.title.to_sym]
  end

  def next_room(choice)
    room_key = get_next_room_key(choice)
    Room.find_by(title: ROOMS[room_key][:title])
  end
end