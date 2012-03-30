class House < ActiveRecord::Base
   validates_presence_of :street, :number, :neightborhood, :city,:state, :country
   validates :number, :complement, :numericality => true
   has_one :user
end
