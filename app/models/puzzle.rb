class Puzzle < ApplicationRecord
  belongs_to :room
  
  validates :title, presence: true
  validates :question, presence: true
  validates :choices, presence: true
  validates :correct_option, presence: true
end
