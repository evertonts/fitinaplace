class Event < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :name, :description
  has_many :offerings
#  extend FriendlyId
#  friendly_id :name, use: [:slugged, :history]
  has_attached_file :avatar, :styles => { :large => "600x600", :medium => "300x300>", :thumb => "100x100>" }
  
  def get_address
    unless self.address_id.nil?
      address = Address.find self.address_id
      return address.street + ", " + address.number.to_s + " " + address.neightborhood + " - " + address.city + " - " + address.state
    else
      return self.address + " " + self.city + " - " + self.state
    end 
  end
  
end
