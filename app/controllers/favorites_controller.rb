class FavoritesController < ApplicationController
  def create
    shout = Shout.find(params[:shout_id])
    current_user.like(shout)
    redirect_to :back
  end

  def destroy
    shout = Shout.find(params[:shout_id])
    current_user.unlike(shout)
    redirect_to :back
  end
end
