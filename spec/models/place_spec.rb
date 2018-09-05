require 'rails_helper'

RSpec.describe Place, type: :model do
 
 before do
 	subject { described_class.new(:name => "Example Place", :description => "Welcome, the first user's place")}
 end

 describe "ActiveModel validations" do
 
  it "should validate presence of name" do
  	expect(subject).to validate_presence_of(:title)
  	expect(response).to be_success
  end

  it "should validate presense of description" do
  	expect(subject).to validate_presence_of(:body)
  end
  
 end

 describe "ActiveRecord associations" do

   it "should belong to user" do
   	expect(subject).to belong_to(:user)
   end

 end

end