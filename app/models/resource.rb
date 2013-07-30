class Resource < ActiveRecord::Base
  has_many :offering, :dependent => :destroy
  belongs_to :address
  has_many :assets, :dependent => :destroy
  accepts_nested_attributes_for :assets, :allow_destroy => true
  accepts_nested_attributes_for :address
   
end
