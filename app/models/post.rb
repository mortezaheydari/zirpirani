class Post < ActiveRecord::Base
  attr_accessible :title, :user_id, :image

  belongs_to :owner, class_name: "User", foreign_key: "user_id"
  make_flaggable :favorite

  validates_presence_of :title, :on => :create, :message => "can't be blank"
  validates_attachment :image,
		:presence => true,
		:content_type => { :content_type =>  ['image/png', 'image/jpg', 'image/jpeg'] },
		:size => { :in => 0..10000.kilobytes }  

  has_attached_file :image, :styles => {:large => "650>"}		


  def favorite_count
      if self.flaggings.with_flag(:favorite).empty?
          0
      else
          self.flaggings.with_flag(:favorite).count
      end
  end  

end
