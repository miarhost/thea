class Place < ApplicationRecord
  
  	mount_uploader :image, ImageUploader
  	
 	validates :name, :description, :image, presence: true
	validates :name, uniqueness: true
	validates :image, allow_blank: true, format: {
		with: %r{\.(gif|jpg|png)\Z}i,
	    message: 'Must be a gif, jpg or png image!' }


  
end
