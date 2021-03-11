class FavouritesController < ApplicationController

  def index
    @favourites = current_user.favourites.order(:order)
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

  def sort
    @favourite = Favourite.find(params[:id])
    @favourite.update(order: params[:order].to_i + 1)
    @favourite.user.favourites.where.not(id: @favourite.id).each do |f|
      if params[:order].to_i > params[:old].to_i
        if f.order > params[:old].to_i + 1 && f.order <= params[:order].to_i + 1
          f.update(order: f.order - 1)
        end
      else
        if f.order < params[:old].to_i + 1 && f.order >= params[:order].to_i + 1
          f.update(order: f.order + 1)
        end
      end
    end
    respond_to do |format|
      format.json { head :ok }
    end
  end

end
