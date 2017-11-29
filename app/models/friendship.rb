class Friendship < ApplicationRecord
  belongs_to :follower, class_name: 'User' 
end
