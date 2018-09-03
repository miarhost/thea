class PlacesController < ApplicationController
 before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
  	@places = Place.all
  end

  def new
  	@place = Place.new
  end
  
   def show
  	@place = Place.find(params[:id])
  end

  def create
  	@place = Place.find(place_params)
  	respond_to do |format|
  	if @place.save
        format.html { redirect_to @places, notice: 'New place was created.' }
        format.json { render :show, status: :created, location: @place}
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

  def set_place
  	@place = Place.find(params[:id])
  end

  def place_params
  	params.require(:place).permit(:name, :description, :image, :image_cache)
  end

end
