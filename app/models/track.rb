class Track < ActiveRecord::Base
  attr_accessible :album_id, :bonus, :lyrics, :name, :ord
  
  belongs_to :album
  
  validates :album, :lyrics, :name, :ord, :presence => true
  # can't use presence validation with boolean field
  validates :bonus, :inclusion => { :in => [true, false] }
  validates :ord, :uniqueness => { :scope => :album_id }
end
