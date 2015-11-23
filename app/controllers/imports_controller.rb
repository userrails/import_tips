require 'spreadsheet'
require 'csv'
class ImportsController < ApplicationController
  def import
    @title="Import Users"
  end

  def upload_xls
    @title="Import canadian only Users"
    Spreadsheet.client_encoding='UTF-8'
    if params[:file].present?
      book=Spreadsheet.open params[:file].tempfile
      sheet1=book.worksheet 0
      sheet1.each 1 do |row|
        @ab_business_databases= Business.new(:address=>row[1], :city=>row[2], :company_name=>row[3], :contact_name=>row[4],
          :employee=>row[5], :fax_number=>row[6], :gender=>row[7], :major_division_description=>row[8],
          :phone_number=>row[9],:province => row[10],:sales => row[11], :sic_2_code_description=>row[12], :sic_4_code=> row[13], :sic_4_code_description=>row[14], :title=>row[15], :zip_code=>row[16])

        if @ab_business_databases.present?
          @ab_business_databases.save
        end
      end
    end
    redirect_to '/'
  end
  
  def upload_xls
    @title="Import canadian only Users"
    Spreadsheet.client_encoding='UTF-8'
    if params[:file].present?
      book=Spreadsheet.open params[:file].tempfile
      sheet1=book.worksheet 0
      sheet1.each 1 do |row|
       StoreTiming.create({:id=>row[0], :business_id=>row[1], :mon_from=>row[2], :mon_to=>row[3], :tue_from=>row[4], :tue_to=>row[5], :wed_from=>row[6], :wed_to=>row[7], :thur_from=>row[8], :thur_to=>row[9],
          :fri_from=>row[10], :fri_to=>row[11], :sat_from=>row[12], :sat_to=>row[13],
          :sun_from=>row[14], :sun_to=>row[15]}) if StoreTiming.present?
      end
    end
    redirect_to '/'
  end

  #CSV IMPORT for business
  def upload_csv
    @title="Import Users"
    if request.post?
      CSV.parse(params[:file].read, :encoding=>"UTF-8") do |row|
        row = row.collect(&:to_s).collect(&:strip).collect{|s| s.gsub("\"", "")}
        # row = row[0].to_s.split("\t").collect(&:strip)

	 Businessnew.create({:address=>row[3], :category=>row[10], :city=>row[4], :id=>row[0],
          :latitude=>row[9], :longitude=>row[8], :name=>row[1], :phone=>row[7],
          :postal_code=>row[6].split(" ").join(''), :state=>row[5], :url=>row[2]}) if Businessnew.present?

#force_encoding("UTF-8")
#.encode("ISO-8859-1")
#.force_encoding("ISO-8859-1").encode("UTF-8")
#force_encoding("BINARY")

      #  CsvBusiness.create({
         # :address=>row[5],
          #:city=>row[6],
          #:company_name=>row[4],
          #:contact_name=>row[9],
          #:employee=>row[12],
          #:fax_number=>row[15],
          #:gender=>row[10],
         # :major_division_description=>row[0],
         # :phone_number=>row[14],
         # :province=>row[7],
         # :sales=>row[13],
         # :sic_2_code_description=>row[1],
         # :sic_4_code=>row[2],
         # :sic_4_code_description=>row[3],
          #:title=>row[11],
          #:zip_code=>row[8]
       # })

=begin
#20130615051307
		StoreTiming.create({:id=>row[0], :business_id=>row[1], :mon_from=>row[2], :mon_to=>row[3], :tue_from=>row[4], :tue_to=>row[5], :wed_from=>row[6], :wed_to=>row[7], :thur_from=>row[8], :thur_to=>row[9],
          :fri_from=>row[10], :fri_to=>row[11], :sat_from=>row[12], :sat_to=>row[13],
          :sun_from=>row[14], :sun_to=>row[15]})
=end
      end

      flash[:notice] = "Uploading completed."
      redirect_to root_path
    else
      render :layout => false
    end

  end

  
  def str_upload_xls
    @title="Import Users"
    Spreadsheet.client_encoding='UTF-8'
    if params[:file].present?
      book=Spreadsheet.open params[:file].tempfile
      sheet1=book.worksheet 0
      sheet1.each 1 do |row|
        @store = StoreTiming.new(:id=>row[0], :business_id=>row[1], :mon_from=>row[2], :mon_to=>row[3], :tue_from=>row[4], :tue_to=>row[5], :wed_from=>row[6], :wed_to=>row[7], :thur_from=>row[8], :thur_to=>row[9],
          :fri_from=>row[10], :fri_to=>row[11], :sat_from=>row[12], :sat_to=>row[13],
          :sun_from=>row[14], :sun_to=>row[15])
        if @store.present?
          @store.save
        end
      end
    end
    redirect_to '/'
  end

  #businessnew import code 2013 august
  def str1_upload_xls
    @title="Import Users"
    Spreadsheet.client_encoding='UTF-8'
    if params[:file].present?
      book=Spreadsheet.open params[:file].tempfile
      sheet1=book.worksheet 0
      sheet1.each 1 do |row|
        @store = Businessnew.new(:address=>row[3], :category=>row[10], :city=>row[4], :id=>row[0],
          :latitude=>row[9], :longitude=>row[8], :name=>row[1], :phone=>row[7],
          :postal_code=>row[6].split(" ").join(''), :state=>row[5], :url=>row[2])
        if @store.present?
          @store.save
        end
      end
    end
    redirect_to '/'
  end

  def strmerged_upload_xls
    @title="Import Users"
    Spreadsheet.client_encoding='UTF-8'
    if params[:file].present?
      book=Spreadsheet.open params[:file].tempfile
      sheet1=book.worksheet 0
      sheet1.each 1 do |row|
        @store = Businessmerged.new(:address=>row[1], :category=>row[2], :city=>row[3], :fri_from=>row[4],
          :fri_to=>row[5], :id=>row[6], :latitude=>row[7], :longitude=>row[8], :mon_from=>row[9],
          :mon_to=>row[10], :name=>row[11], :phone=>row[12], :postal_code=>row[13], :sat_from=>row[14], :sat_to=>row[15], :state=>row[16], :sun_from=>row[17], :sun_to=>row[18], :thur_from=>row[19], :thur_to=>row[20], :tue_from=>row[21], :tue_to=>row[22], :url=>row[23], :wed_from=>row[24], :wed_to=>row[25])
        if @store.present?
          @store.save
        end
      end
    end
    redirect_to '/'
  end

  def create_new_db
    ListingOn.limit(2).each do |listing|
      NewListing.create(:city => listing.city,:postal_code => listing.postalcode,:latitude => listing.latitude,:longitude => listing.longitude) if !NewListing.exists?(:city => listing.city, :postal_code => listing.postal_code)
    end
  end
end
