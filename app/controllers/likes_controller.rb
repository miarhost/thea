class LikesController < ApplicationController


 skip_before_action :verify_authenticity_token
 before_action :authenticate_user!
 before_action :find_place, only: [:create, :destroy]
 


  def create
	@like = current_user.likes.build(user_id: current_user.id)
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

def liked?
  Like.where(user_id: current_user.id, place_id:
  params[:place_id]).exists?
end

  def destroy
 	@like = current_user.likes.build(user_id: current_user.id)
	@like.place_id = params[:place_id]
  	if !user_signed_in?
    redirect_to new_user_session_path
    end
   	if !liked?
  	flash[:notice] = 'Like first!'
      else
    @like.destroy
    redirect_to place_path(@place)  
    end
   
  end
 
 def total_likes
 	place.likes.count
 end
 
 private 

 def find_place
  @place = Place.find(params[:place_id])
 end

end