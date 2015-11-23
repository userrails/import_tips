class Business < ActiveRecord::Base
  attr_accessible :address, :city,:province,:sic_4_code,:sales, :company_name, :contact_name, :employee, :fax_number, :gender, :major_division_description, :phone_number, :provincesic_4_code, :sic_4_code_description, :title, :ab_business_database_id, :zip_code, :longitude, :latitude, :gmaps
  #acts_as_gmappable
  #geocoded_by :address
  has_many :store_timings, :dependent => :destroy

  #def gmaps4rails_address
    #"#{self.address}"
  #end

  define_index do
    indexes company_name
  end

end
