class House < ActiveRecord::Base
  has_many :resource, :dependent => :destroy
   validates_presence_of :street, :number, :neightborhood, :city,:state, :country, :image
   validates :number, :numericality => true
   belongs_to :user
   
   has_attached_file :image, :styles => { :large => "600x600", :medium => "300x300>", :thumb => "100x100>" }
end
