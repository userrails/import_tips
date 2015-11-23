class Timing < ActiveRecord::Base
  attr_accessible :business_id, :day, :end_time, :start_time
  belongs_to :business
end
