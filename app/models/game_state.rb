class GameState < ApplicationRecord
  belongs_to :current_room, class_name: 'Room'

  store :flags, accessors: [:madness, :void, :submission, :resistance, :correct_answers, :exit, :has_backtracked], coder: JSON

  before_create :initialize_flags

  def initialize_flags
    self.flags = {
      madness: 0,
      void: 0,
      submission: 0,
      resistance: 0,
      correct_answers: 0,
      exit: nil,
      has_backtracked: false
    }
  end

  def check_ending
    if correct_answers == 3 && flags[:exit] == '出るため'
      'celebration'
    elsif correct_answers == 0 && flags[:exit] == '出るため'
      'forgotten'
    elsif correct_answers == 1 || flags[:void] >= 4
      'buried'
    elsif flags[:resistance] == 0 && !flags[:has_backtracked]
      'observed'
    elsif correct_answers == 1 && flags[:madness] >= 3
      'loop'
    else
      nil
    end
  end
end