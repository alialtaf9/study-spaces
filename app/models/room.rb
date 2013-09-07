class Room < ActiveRecord::Base
  belongs_to :building
  has_many :users, :posts
  attr_accessible :name
end
