class RoomsController < ApplicationController
  before_action :set_game_state, except: [:start]
  
  def start
    start_room = Room.find_by(room_type: :start)
    @game_state = GameState.create!(
      current_room: start_room,
      flags: {
        madness: 0,
        void: 0,
        submission: 0,
        resistance: 0,
        correct_answers: 0,
        exit: nil,
        has_backtracked: false
      }
    )
    redirect_to game_room_path(@game_state, start_room)
  end

  def show
    @room = @game_state.current_room
    case @room.room_type
    when 'corridor'
      render :corridor
    when 'puzzle'
      @puzzle = @room.puzzle
      @choices = GameConstants::CHOICES[@room.identifier.to_sym]
      render :puzzle_room
    else
      @choices = standard_room_choices
      render :standard_room
    end
  end

  def make_choice
    choice = params[:choice]
    
    case @game_state.current_room.room_type
    when 'corridor'
      handle_corridor_choice(choice)
    when 'puzzle'
      handle_puzzle_choice(choice)
    else
      handle_standard_room_choice(choice)
    end
  end

  private

  def set_game_state
    @game_state = GameState.find(params[:game_id])
  end

  def standard_room_choices
    [
      { description: "進む", action: 'proceed' },
      { description: "部屋を調べる", action: 'investigate' }
    ].tap do |choices|
      choices << { description: "戻る", action: 'back' } unless @game_state.flags["has_backtracked"]
    end
  end

  def handle_corridor_choice(choice)
    case choice
    when 'proceed'
      next_room = RoomTransitionService.new(@game_state).next_room
      @game_state.update(current_room: next_room)
      redirect_to game_room_path(@game_state, next_room)
    when 'investigate'
      @game_state.increment!(:void)
      flash[:notice] = "何も見つからなかった..."
      redirect_to game_room_path(@game_state, @game_state.current_room)
    when 'back'
      previous_room = RoomTransitionService.new(@game_state).previous_room
      @game_state.update(has_backtracked: true)
      @game_state.update(current_room: previous_room)
      redirect_to game_room_path(@game_state, previous_room)
    end
  end

  def handle_standard_room_choice(choice)
    case choice
    when 'proceed'
      redirect_to game_room_path(@game_state, @game_state.current_room)
    when 'investigate'
      flash[:notice] = generate_investigation_message
      redirect_to game_room_path(@game_state, @game_state.current_room)
    when 'back'
      previous_room = RoomTransitionService.new(@game_state).previous_room
      redirect_to game_room_path(@game_state, previous_room)
    end
  end

  def generate_investigation_message
    [
      "壁には古びた壁紙が貼られている...",
      "部屋の隅に蜘蛛の巣が見える...",
      "何かの気配を感じるが、正体は分からない...",
      "微かに誰かの足音が聞こえる気がする..."
    ].sample
  end
end