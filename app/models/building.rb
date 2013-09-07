class Building < ActiveRecord::Base
  has_many :rooms
  attr_accessible :address, :name
end
