class Address < ActiveRecord::Base
  validates_presence_of :street, :number, :neightborhood, :city,:state, :country
  validates :number, :numericality => true
  def to_s
    link = self.street
    if self.number != nil
      link  = link.concat(", ").concat(self.number.to_s)
    end
    if self.complement != nil && self.complement != ""
      link  = link.concat(" - ").concat(self.complement)
    end
    if self.neightborhood != nil
      link  = link.concat(" - ").concat(self.neightborhood)
    end
    return link
  end
  
  
end