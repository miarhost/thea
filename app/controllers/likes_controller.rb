class LikesController < ApplicationController


 skip_before_action :verify_authenticity_token
 before_action :authenticate_user!
 before_action :find_place, only: [:create, :destroy]
 before_action :find_like, only: [:destroy]


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
   	 if !liked?
  	flash[:notice] = 'Like first!'
      else
    @like.destroy
    redirect_to place_path(@place), :notice => 'Unliked!'
     end
  end
 
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

  def find_like
  	@place.likes.find(params[:id])
  end  

end