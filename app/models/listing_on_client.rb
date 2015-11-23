class ListingOnClient < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :business_id, :business_address, :business_name, :categories, :city, :latitude, :longitude, :phonenumber, :postalcode, :province, :website
end
