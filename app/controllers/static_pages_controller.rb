class StaticPagesController < ApplicationController
  def landing_page
  	@places = Place.all
  end
end
