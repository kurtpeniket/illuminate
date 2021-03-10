class FavouritesController < ApplicationController

def index
  @favourites = Favourite.all
end

def create
  @lightbulb = Lightbulb.find(params[:lightbulb_id])
  @user = current_user.id
  @favourite = Favourite.new(user_id: @user, lightbulb_id: @lightbulb.id)
  if @favourite.save
    flash[:notice] = "Saved to favourites!"
    redirect_to lightbulbs_path anchor: "title"
  end
end

def destroy
  @favourite = Favourite.find(params[:id])
  if @favourite.destroy
    flash[:alert] = "Favorite removed!"
    redirect_to favourites_path
  end
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
