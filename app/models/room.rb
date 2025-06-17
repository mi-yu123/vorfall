class Room < ApplicationRecord
  has_one :puzzle, dependent: :nullify
  has_many :choices, dependent: :destroy
  has_many :next_rooms, through: :choices

  enum room_type: {
    start: 0,    # 開始部屋
    normal: 1,   # 通常部屋
    puzzle: 2,   # 謎解き部屋
    corridor: 3,   # 廊下
    ending: 4    # 最終判定部屋
  }

  validates :title, presence: true
  validates :description, presence: true

  def self.start_room
    find_by(room_type: :start)
  end
end
