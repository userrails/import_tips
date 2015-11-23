require 'spreadsheet'
require 'csv'
class ImportscanadianController < ApplicationController
  def import
	@title="Import Users"
  end

=begin
  def ab_upload_xls
    @title="Import canadian only Users"
    Spreadsheet.client_encoding='UTF-8'
    if params[:file].present?
      book=Spreadsheet.open params[:file].tempfile
      sheet1=book.worksheet 0
      sheet1.each 1 do |row|
       @ab_business_databases= Abbusiness.new(:address=>row[1], :city=>row[2], :company_name=>row[3], :contact_name=>row[4],
          :employee=>row[5], :fax_number=>row[6], :gender=>row[7], :major_division_description=>row[8],
          :phone_number=>row[9], :province => row[10], :sales => row[11], :sic_2_code_description=>row[12], :sic_4_code=> row[13],
          :sic_4_code_description=>row[14], :title=>row[15], :zip_code=>row[16])

        if @ab_business_databases.present?
    	    if !Abbusiness.exists?(:city => row[2], :zip_code => row[16])
    	      @ab_business_databases.save
    	    end
    	  end
     end
    redirect_to '/'
   end  
  end
  #this is the longitude and latitude generator by zipcode with xls file import  
=end
  
  
  def ab_upload_xls
    @title="Import Users"
    if request.post?
      CSV.parse(params[:file].read) do |row|
        row = row.collect(&:to_s).collect(&:strip).collect{|s| s.gsub("\"", "")}
        # row = row[0].to_s.split("\t").collect(&:strip)
=begin
        Abbusiness.create({
            :address=>row[5],
            :city=>row[6],
            :company_name=>row[4],
            :contact_name=>row[9],
            :employee=>row[12],
            :fax_number=>row[14],
            :gender=>row[10],
            :major_division_description=>row[0],
            :phone_number=>row[15],
             :province => row[7],
             :sales => row[13],
             :sic_2_code_description=>row[1],
             :sic_4_code=> row[2],
             :sic_4_code_description=>row[3],
             :title=>row[11],
             :zip_code=>row[8]
          })if !Abbusiness.exists?(:zip_code => row[8])
      end
=end
      
      NewListing.create({
      :city=>row[6],
      :postal_code=>row[8],
      })if !NewListing.exists?(:postal_code=>row[8])
      end

      flash[:notice] = "Uploading completed."
      redirect_to root_path
    else
      render :layout => false
    end
  end
  #this is the longitude and latitude generator by zipcode with xls file import
end
