class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :likes, dependent: :destroy
  has_many :places, through: :likes
  
def heart!(place)
  self.likes.create!(place_id: place.id)
end

# destroys a heart with matching post_id and user_id
def unlike!(place)
  like = self.likes.find_by_place_id(place.id)
  like.destroy!
end

# returns true of false if a post is hearted by user
def heart?(post)
  self.likes.find_by_place_id(place.id)
end


end
