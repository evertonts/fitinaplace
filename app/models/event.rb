class Event < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :name, :description, :address, :city, :state
  has_many :offerings
  
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }
end
