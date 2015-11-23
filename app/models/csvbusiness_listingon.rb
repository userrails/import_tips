class CsvbusinessListingon < ActiveRecord::Base
  attr_accessible :address, :city, :company_name, :contact_name, :created_at, :employee, :fax_number, :frifrom, :frito, :gender, :latitude, :longitude, :major_division_description, :monfrom, :monto, :phone_number, :province, :sales, :satfrom, :satto, :sic_2_code_description, :sic_4_code, :sic_4_code_description, :sunfrom, :sunto, :thurfrom, :thurto, :title, :tuefrom, :tueto, :updated_at, :wedfrom, :wedto, :zip_code
#use this model for inserting records from csv format
#because first i'm selecting the records from csvbusinesses and listing_ons table 
#and i'm importing the selected records to /tmp/csvbuslistings.csv
#then i can import this csv to my table csvbusiness_listingons for further processing

end
