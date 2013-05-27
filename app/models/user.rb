class User < ActiveRecord::Base
  attr_accessible :account_id, :name

  belongs_to :account
  has_many :posts

  validates_presence_of :name, :on => :create, :message => "can't be blank"
  validates_uniqueness_of :name, :on => :create, :message => "already taken"
  
end
