class Abbusiness < ActiveRecord::Base
  attr_accessible :address, :city, :company_name, :contact_name, :employee, :fax_number, :gender, :gmaps, :latitude, :longitude, :major_division_description, :phone_number, :province, :sales, :sic_2_code_description, :sic_4_code, :sic_4_code_description, :title, :zip_code

  acts_as_gmappable
  geocoded_by :zip_code

  def gmaps4rails_address
    "#{self.zip_code}"
  end

end
