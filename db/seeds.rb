GameConstants::ROOMS.each do |key, room_data|
  Room.create!(
    title: room_data[:title],
    description: room_data[:description],
    room_type: room_data[:room_type]
  )
end