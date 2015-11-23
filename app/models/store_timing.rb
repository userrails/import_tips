class StoreTiming < ActiveRecord::Base
  attr_accessible :mon_from, :mon_to, :tue_from, :tue_to, :wed_from, :wed_to, :thur_from, :thur_to, :fri_from, :fri_to, :sat_from, :sat_to, :sun_from, :sun_to, :business_id
  belongs_to :business
end
