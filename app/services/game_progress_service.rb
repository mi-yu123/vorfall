class GameProgressService
  include GameConstants
  
  def initialize(game_state)
    @game_state = game_state
  end

  def process_choice(choice)
    update_flags(choice)
    check_puzzle_answer(choice) if choice.room.puzzle
  end

  private

  def update_flags(choice)
    flag_type = get_flag_type(choice)
    @game_state.flags[flag_type] += 1
  end

  def check_puzzle_answer(choice)
    puzzle = choice.room.puzzle
    if choice.description == puzzle.correct_option
      @game_state.flags[:correct_answers] += 1
    end
  end

  def get_flag_type(choice)
    CHOICES[choice.room.title.to_sym].find { |c| c[:description] == choice.description }[:flag_type]
  end
end