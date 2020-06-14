class FavoritesController < ApplicationController

  def create
    @favorite = current_user.favorites.create(bike_id: params[:bike_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @bike = Bike.find(params[:bike_id])
    @favorite = current_user.favorites.find_by(bike_id: @bike.id)
    @favorite.destroy
    redirect_back(fallback_location: root_path)
  end

end
