class FavouritesController < ApplicationController

def index
  @favourites = Favourite.all
end

def create
  @lightbulb = Lightbulb.find(params[:lightbulb_id])
  @user = current_user.id
  @favourite = Favourite.create(user_id: @user, lightbulb_id: @lightbulb.id)
end

def destroy
  @favourite = Favourite.find(params[:id])
  @favourite.destroy
  redirect_to favourites_path
end

end
