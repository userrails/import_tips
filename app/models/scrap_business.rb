class ScrapBusiness < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible  :address,:city,:company_name,:categories,:phone_no,:province,:zipcode,:url,:mon_from,:mon_to,:tue_from,:tue_to,:wed_from,:wed_to,:thu_from,:thu_to,:fri_from,:fri_to,:sat_from,:sat_to,:sun_from,:sun_to,:long,:lat,:csv_business_id
  belongs_to :manual_fetch
end
