class Businessnew < ActiveRecord::Base
  attr_accessible :id, :name, :url, :address, :city, :state, :postal_code, :phone, :longitude, :latitude, :category
end
