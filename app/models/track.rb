class Track < ActiveRecord::Base
  belongs_to :album
  has_one :band, :through => :album, :source => :band

  validates :album, :lyrics, :name, :ord, :presence => true
  # can't use presence validation with boolean field
  validates :bonus, :inclusion => { :in => [true, false] }
  validates :ord, :uniqueness => { :scope => :album_id }
end

