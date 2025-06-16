class RoomsController < ApplicationController
  before_action :set_room

  def show
    session[:visited_rooms] ||= []
    session[:visited_rooms] << @room.id unless session[:visited_rooms].include?(@room.id)

    if @room.is_ending?
      redirect_to ending_path(key: @room.ending_key) and return
    end
  end

  private

  def set_room
    @room = Room.find(params[:id])
  end
end
