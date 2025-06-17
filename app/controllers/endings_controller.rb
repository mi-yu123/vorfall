class EndingsController < ApplicationController
  def show
    @ending = Ending.find_by!(key: params[:id])
  end
end