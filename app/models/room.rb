class Room < ApplicationRecord
  belongs_to :puzzle, optional: true
end
