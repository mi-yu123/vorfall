class Puzzle < ApplicationRecord
  belongs_to :room
  serialize :flags, coder: JSON
  
  validates :title, presence: true
  validates :question, presence: true
  validates :correct_option, presence: true
end
