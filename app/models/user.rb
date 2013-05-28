class User < ActiveRecord::Base
  rolify before_add: :before_change, before_remove: :before_change

  attr_accessible :account_id, :name

  belongs_to :account
  has_many :posts

  make_flagger

  validates_presence_of :name, :on => :create, :message => "can't be blank"
  validates_uniqueness_of :name, :on => :create, :message => "already taken"

  def favorite_posts
    self.flaggings.with_flag(:favorite)
  end

  def before_change(role)
    redirect_to root_path unless current_user && current_user.has_role? :admin
  end 

end
