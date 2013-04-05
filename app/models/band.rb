class Band < ActiveRecord::Base
  attr_accessible :name
  
  has_many :albums
  
  validates :name, :uniqueness => :true
  validates :name, :presence => :true
end
