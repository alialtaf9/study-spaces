class User < ActiveRecord::Base
  attr_accessible :name, :facebook_id

  def self.create_new_user(auth_hash)
    user = User.new
    user.update_attributes(:name => auth_hash.info.name, :facebook_id => auth_hash.uid)
  end
end
