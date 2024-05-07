class PantriesController < ApplicationController
  def show
    @pantry = Pantry.find_by(user: current_user)
  end
end
