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

  def google_maps_link
    "http://maps.google.com.br/maps?q=#{self.street}+#{self.number}+#{self.complement}+#{self.neightborhood}" +
       "+#{self.city}+#{self.state}+#{self.country}&output=embed".gsub(/[ ]/, "+")
  end
  
  
end