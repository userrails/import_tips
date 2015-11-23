class ManualFetch < ActiveRecord::Base
  attr_accessible :address, :city, :company_name, :contact_name, :employee, :fax_number, :gender, :major_division_description, :phone_number, :province, :sales, :sic_2_code_description, :sic_4_code, :sic_4_code_description, :title, :zip_code, :url, :monfrom,:monto,:tuefrom,:tueto,:wedfrom,:wedto,:thufrom,:thuto,:frifrom,:frito,:satfrom,:satto,:sunfrom,:sunto
  has_many :scrap_businesses,:dependent => :destroy
end
