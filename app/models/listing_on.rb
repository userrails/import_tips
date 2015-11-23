class ListingOn < ActiveRecord::Base
  attr_accessible :business_address, :business_name, :categories, :city, :latitude, :longitude, :phonenumber, :postalcode, :province, :website
end
