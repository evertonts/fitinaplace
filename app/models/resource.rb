class Resource < ActiveRecord::Base
  has_many :offering, :dependent => :destroy
  has_many :assets, :dependent => :destroy
  belongs_to :house
  accepts_nested_attributes_for :assets, :allow_destroy => true
  
end
