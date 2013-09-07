class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :room
  attr_accessible :text, :title, :timestamp
end
