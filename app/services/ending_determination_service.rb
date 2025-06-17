class EndingDeterminationService
  def initialize(game_state)
    @game_state = game_state
  end

  def determine_ending
    return :celebration if celebration_conditions_met?
    return :forgotten if forgotten_conditions_met?
    return :buried if buried_conditions_met?
    return :watched if watched_conditions_met?
    return :loop if loop_conditions_met?
  end

  private

  def celebration_conditions_met?
    @game_state.flags[:correct_answers] == 3 && 
      @game_state.flags[:exit] == "出るため"
  end

  def forgotten_conditions_met?
    @game_state.flags[:correct_answers] == 0 &&
      @game_state.flags[:exit] == "出るため"
  end

  def buried_conditions_met?
    @game_state.flags[:correct_answers] == 1 ||
      @game_state.flags[:void] >= 4
  end

  def watched_conditions_met?
    @game_state.flags[:resistance] == 0 &&
      !@game_state.flags[:has_backtracked]
  end

  def loop_conditions_met?
    @game_state.flags[:correct_answers] == 1 &&
      @game_state.flags[:madness] >= 3
  end
end