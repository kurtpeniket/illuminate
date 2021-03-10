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

def update
  @favourite = Favourite.find(params[:id])
  @favourite.update(order: params[:order] + 1)
  @favourite.user.favourites.where.not(id: @favourite.id).where("order >= ?", @favourite.order).each do |f|
    f.update(order: f.order + 1)
  end
  respond_to do |format|
    format.json { head :no_content }
  end
end

end
