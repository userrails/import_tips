require 'csv'
require 'rails/all'

class ExportsController < ApplicationController

  def export
    @posts = BusinessNew.order(:created_at)

        respond_to do |format|
          format.html
          format.csv { send_data @posts.as_csv }
        end
  end
  
end
