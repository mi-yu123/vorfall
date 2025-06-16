class Choice < ApplicationRecord
  belongs_to :room
  belongs_to :next_room, class_name: 'Room'
  
  validates :description, presence: true
end