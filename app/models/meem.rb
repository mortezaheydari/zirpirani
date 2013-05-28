# 'Meem' actually stands for 'Mime' which is a reserved word.

class Meem < ActiveRecord::Base
  attr_accessible :description, :image, :title

  validates_presence_of :title, :description

  validates_attachment :image,
		:presence => true,
		:content_type => { :content_type =>  ['image/png', 'image/jpg', 'image/jpeg'] },
		:size => { :in => 0..10000.kilobytes }  

  has_attached_file :image, :styles => {:medium => "450>"}		

end