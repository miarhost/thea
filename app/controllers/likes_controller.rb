class LikesController < ApplicationController

#respond_to :js
 skip_before_action :verify_authenticity_token
 before_action :authenticate_user!
 before_action :find_place, only: [:create, :destroy]
 

  def create
	@like = current_user.likes.create(user_id: current_user.id)
	@like.place_id = params[:place_id]
	  if !user_signed_in?
    redirect_to new_user_session_path
     end
     if current_user
	@like.save
	flash[:success] = 'Liked!'
redirect_to place_path(@place)
     end
  end

  def destroy
    place.likes.where(user: current_user).destroy_all
    redirect_to place_redirect(place), :notice => 'Unliked!'
  end


 #def likes
    #place.likes.where(user: current_user)
  #end


 
 def total_likes
 	place.likes.count
 end

 private 

 def like_params
 	params.require(:likes).permit(:user_id, :place_id)
 end

  def find_place
   @place = Place.find(params[:place_id])
  end

end