class GameController < ApplicationController
  def start
    @game_state = GameState.create(current_room: Room.find_by(room_type: :start))
    @game_state.initialize_flags
    render :show
  end

  def show
    @game_state = GameState.find(params[:id])
    @room = @game_state.current_room
    @choices = available_choices(@room)
  end

  def make_choice
    @game_state = GameState.find(params[:game_state_id])
    choice = Choice.find(params[:choice_id])
    
    GameProgressService.new(@game_state).process_choice(choice)
    next_room = RoomTransitionService.new(@game_state.current_room).next_room(choice)
    
    @game_state.update(current_room: next_room)
    
    if next_room.corridor?
      redirect_to corridor_game_path(@game_state)
    elsif next_room.ending?
      ending_key = EndingDeterminationService.new(@game_state).determine_ending
      redirect_to ending_path(ending_key)
    else
      redirect_to game_path(@game_state)
    end
  end

  def corridor
    @game_state = GameState.find(params[:id])
    render :corridor
  end

  private

  def available_choices(room)
    return [] unless room
    RoomTransitionService.new(room).available_choices
  end
end