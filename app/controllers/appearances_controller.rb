class AppearancesController < ApplicationController

  def show
    @appearance = Appearance.find(params[:id])
  end

  def new
    @appearance = Appearance.new
    @guests = Guest.all
    @episodes = Episode.all
  end

  def create
    @appearance = Appearance.new(appearance_params(:guest_id, :episode_id, :rating))
    if @appearance.save
      redirect_to appearance_path(@appearance)
    else
      # TODO: Add error message to top of page to indicate why save didnt work
      redirect_to new_appearance_path
    end
  end

  private

  def appearance_params(*args)
    params.require(:appearance).permit(*args)
  end

end
