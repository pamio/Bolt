class Group < ActiveRecord::Base
  has_many :users_groups
  has_many :users, :class_name => "Bolt::User", :through => :users_groups, :dependent => :destroy
end

