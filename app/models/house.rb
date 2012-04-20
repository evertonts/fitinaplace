class House < ActiveRecord::Base
   validates_presence_of :street, :number, :neightborhood, :city,:state, :country
   validates :number, :numericality => true
   belongs_to :user
end
