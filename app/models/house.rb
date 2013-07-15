class House < ActiveRecord::Base
  has_many :resources, :dependent => :destroy
  validates_presence_of :image
  belongs_to :user
  has_attached_file :image, :styles => { :large => "600x600", :medium => "300x300>", :thumb => "100x100>" },:default_url => '/assets/notFound.png'
   
  def get_address
    self.street + ", " + self.number.to_s + " " + self.neightborhood + " - " + self.city + " - " + self.state
  end
end
