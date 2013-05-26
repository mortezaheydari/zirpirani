class User < ActiveRecord::Base
  attr_accessible :account_id, :name

  validates_presence_of :name, :on => :create, :message => "can't be blank"
  validates_uniqueness_of :name, :on => :create, :message => "already taken"
  
end
