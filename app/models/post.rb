class Post < ActiveRecord::Base
  attr_accessible :title, :user_id, :image

  validates_attachment :image,
		:presence => true,
		:content_type => { :content_type =>  ['image/png', 'image/jpg', 'image/jpeg'] },
		:size => { :in => 0..10000.kilobytes }  

  has_attached_file :image, :styles => { :medium => "200x200>", :thumb => "143x143#", :large => "1024x768>", :small => "50x50#", :profile => "350x350#" }		
end
