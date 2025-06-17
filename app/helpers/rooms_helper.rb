module RoomsHelper
  def room_atmosphere_class
    return "bg-gray-900" if @game_state.flags[:is_dark]
    return "bg-red-900" if @game_state.flags[:madness] > 3
    return "bg-gray-800"
  end

  def generate_room_effect
    effects = []
    effects << "blur-sm" if @game_state.flags[:void] > 2
    effects << "animate-pulse" if @game_state.flags[:madness] > 2
    effects.join(" ")
  end
end
