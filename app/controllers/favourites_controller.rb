class FavouritesController < ApplicationController

def index
  @favourites = Favourite.all
end

def create
  @lightbulb = Lightbulb.find(params[:lightbulb_id])
  @user = current_user.id
  @favourite = Favourite.create(user_id: @user, lightbulb_id: @lightbulb.id)
end


# def favourite_params
#   params.require(:favourite).permit(:user_id, :lightbulb_id)
# end

end
