
class PlacesController < ApplicationController
 before_action :authenticate_user!, only: [:create]
 #before_action :set_place, only: [:show, :edit, :update, :destroy]
 skip_before_action :verify_authenticity_token

  def new
  	@place = Place.new
  end
  
   def show
  	@place = Place.find(params[:id])
  end
  
  def index
    
    @places = Place.paginate(:page => params[:page], :per_page => 20)
  
  end

  def create
   @place = current_user.places.build(place_params) 
     if !user_signed_in?
      redirect_to new_user_session_path
     end
  	respond_to do |format|
  	if @place.save
        format.html { redirect_to places_url, notice: 'New place was created.' }
        format.json { render :show, status: :created, location: @place }
      else
        format.html { render :new }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
  	 respond_to do |format|
      if @place.update(place_params)
        format.html { redirect_to @place, notice: 'Place was successfully updated.' }
        format.json { render :show, status: :ok, location: @place }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end


    def destroy
    @place.destroy
    respond_to do |format|
      format.html { redirect_to places_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private 

 #def set_place
  	#@place = Place.find(params[:id])
  #end

  def place_params
  	params.require(:place).permit(:name, :description, :image, :image_cache)
  end

end
