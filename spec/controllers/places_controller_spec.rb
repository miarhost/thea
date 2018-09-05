require 'rails_helper'

RSpec.describe PlacesController, type: :controller do
 
 before do
  it "set place with params" do
   expect(:valid_attributes).to eql User.place.build(name: "Example", description: "Something by user")
  end 
 end
 
 describe "GET #index" do
  it "returns a success responce" do
     place = User.places.build! valid_attributes
     get :index 
     expect(responce).to be_success
    end
   end

  describe "POST #create" do
    context "with valid attributes" do

    it "create new Place" do
     expect {
      place :create, params: {place: valid_attributes}
     }
     expect(response).to be_success
    end

    it "redirects to created place" do
      expect {  place :create, params: {place: valid_attributes}}
      expect(response).to redirect_to(User.place.last)
     end
    end
   end

  describe "POST #update" do
    context "place with valid attributes exists" do
      @place = Place.find(params[:id])
      it "updates existing post and respond success" do
        expect {
         post :update, params: {place: valid_attributes}
        }
      expect(responce).to assign_to(:place)
    end
   end
 end

end