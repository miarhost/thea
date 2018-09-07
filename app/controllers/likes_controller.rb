class LikesController < ApplicationController


def like
  @user = current_user
  @place = Place.find(params[:place_id])
  @user.like!(@place)
end

def unlike
  @user = current_user
  @like = @user.likes.find_by_place_id(params[:place_id])
  @place = Place.find(params[:place_id])
  @like.destroy!
end

end