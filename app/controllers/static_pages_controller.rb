class StaticPagesController < ApplicationController
  def landing_page
  	  @places = Place.paginate(:page => params[:page], :per_page => 20)
  end
end
