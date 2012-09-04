class Event < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :name, :description, :address, :city, :state
  has_many :offerings
  
  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]
  
  has_attached_file :avatar, :styles => { :large => "600x600", :medium => "300x300>", :thumb => "100x100>" }
end
