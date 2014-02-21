class Band < ActiveRecord::Base
  has_many :albums

  validates :name, :uniqueness => :true
  validates :name, :presence => :true
end

