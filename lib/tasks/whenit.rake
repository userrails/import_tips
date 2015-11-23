require 'csv'

namespace :project do
  desc "Updating"

  #5603 is the actual records fetched by this process
  desc "Updating new database"
  task :canadiandb => :environment do
    file = File.join(Rails.root,"lib/tasks/BuisDatabase.csv")
    file1 = File.read(file)
    csv = CSV.parse(file1,:headers => false)
    csv[1..11680].each do |row|
      NewListing.create(:city => row[2],:postal_code => row[16],:latitude => row[18],:longitude => row[17]) if !NewListing.exists?(:city => row[2],:postal_code => row[16])
    end
  end


desc "Updating new businesses database"
  task :nu => :environment do
    file = File.join(Rails.root,"lib/tasks/BuiDatabase.csv")
    CSV.foreach(file, :row_sep => :auto, :col_sep => ",", :encoding => 'UTF-8') do |row|
      CanEmail.create(
:company_name=>row[0],:contact_name=>row[1],
:first_name=>row[2],:middle_name=>row[3],
:last_name=>row[4],:title=>row[5],:email=>row[6],:url=>row[7],:major_division_description=>row[8],
:sic_2_code=>row[9],:sic_2_code_description=>row[10],:sic_4_code=>row[11],:sic_4_code_description=>row[12],
:address=>row[13],:city=>row[14],:province=>row[15],
:postal_code=>row[16],:phone_number=>row[17],:fax_number=>row[18],:employee=>row[19],
:sales=>row[20]		
      ) 
    end
  end
end

#@business.save if !(Business.exists?(:city => row[2]) and Business.exists?(:address => row[1]) and Business.exists?(:company_name => row[3])
