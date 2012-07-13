class House < ActiveRecord::Base
  has_many :resource, :dependent => :destroy
   validates_presence_of :image
   belongs_to :user
   has_one :address
   
   has_attached_file :image, :styles => { :large => "600x600", :medium => "300x300>", :thumb => "100x100>" }
   
  def get_address
    unless self.address_id.nil?
      address = Address.find self.address_id
      return address.street + ", " + address.number.to_s + " " + address.neightborhood + " - " + address.city + " - " + address.state
    else
      return self.street + ", " + self.number.to_s + " " + self.neightborhood + " - " + self.city + " - " + self.state
    end 
  end
end
