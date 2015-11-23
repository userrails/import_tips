require 'csv'

class BusinessNew < ActiveRecord::Base
  attr_accessible :address, :company_name
  has_many :timings, :dependent => :destroy
  
  def self.as_csv
        CSV.generate do |csv|
          csv << self.address
          all.each do |item|
            csv << item.attributes.values_at(*address)
          end
        end
      end
      
end
