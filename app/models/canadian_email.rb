class CanadianEmail < ActiveRecord::Base
  # attr_accessible :title, :body
attr_accessible :company_name,:contact_name,:first_name,:middle_name,:last_name,:title,:email,:url,:major_division_description,:sic_2_code,:sic_2_code_description,:sic_4_code,:sic_4_code_description,:address,:city,:province,:postal_code,:phone_number,:fax_number,:employee,:sales		
end
