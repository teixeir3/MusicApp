class Album < ActiveRecord::Base
  attr_accessible :band_id, :live, :name, :year
  
  belongs_to :band
  has_many :tracks
  
  validates :band, :name, :year, :presence => true
  # can't use presence validation with boolean field
  validates :live, :inclusion => { :in => [true, false] }
  validates :name, :uniqueness => { :scope => :band_id }
  validates :year, :numericality => { :minimum => 1900, :maximum => 2999 }
end
