class NewListing < ActiveRecord::Base
   attr_accessible :city,:postal_code,:latitude,:longitude,:gmaps
   
  acts_as_gmappable
  geocoded_by :postal_code

  def gmaps4rails_address
    "#{self.postal_code}"
   end
    
end
