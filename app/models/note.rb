class Note < ApplicationRecord
  belongs_to :user
  has_many :likes
  validates :title, presence:true
  validates :body, presence:true
end
