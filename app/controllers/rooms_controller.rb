class RoomsController < ApplicationController
  def start
    # スタート画面の表示
  end

  def show
    @room = Room.find(params[:id])

    # 開始時にゲーム状態を初期化
    if @room.start?
      initialize_game_state
    end
  end

  private

  def initialize_game_state
    session[:current_count] = 0
    session[:visited_rooms] = []
    session[:always_forward] = true
    session[:backtrack_count] = 0
  end
end
