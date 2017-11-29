class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :email, presence:true
  has_many :notes
  has_many :likes
  has_many :friendships
  has_many :followers, through: :friendships

  def not_followers_with?(follower_id)
    friendships.where(follower_id: follower_id).count < 1
  end

end
