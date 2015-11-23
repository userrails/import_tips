class Businessmerged < ActiveRecord::Base
  attr_accessible :address, :category, :city, :fri_from, :fri_to, :id, :latitude, :longitude, :mon_from, :mon_to, :name, :phone, :postal_code, :sat_from, :sat_to, :state, :sun_from, :sun_to, :thur_from, :thur_to, :tue_from, :tue_to, :url, :wed_from, :wed_to
  #acts_as_gmappable
 # def gmaps4rails_address
    #"#{self.address}"
  #end

  define_index do
    indexes name
  end

end
