class Track < ActiveRecord::Base
  attr_accessible :album_id, :name, :ord
  
  belongs_to :album
  
  validates :album, :name, :ord, :presence => true
  validates :ord, :uniqueness => { :scope => :album_id }
end
