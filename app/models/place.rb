class Place < ApplicationRecord
  
  	validates :name, :description, :image, presence: true
	validates :name, uniqueness: true
	validates :image, allow_blank: true, format: {
		with: %r{\.(gif|jpg|png)\Z}i,
	    message: 'Must be a gif, jpg or png image!' }

mount_uploader :image, ImageUploader

belongs_to :user, :optional => true
     
end
