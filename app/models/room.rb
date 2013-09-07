class Room < ActiveRecord::Base
  belongs_to :building
  attr_accessible :name
end
