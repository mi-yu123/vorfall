class Ending < ApplicationRecord
  validates :key, presence: true, uniqueness: true
  validates :title, presence: true
  validates :description, presence: true
end
