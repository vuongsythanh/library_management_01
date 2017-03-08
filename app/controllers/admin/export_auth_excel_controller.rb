class Admin::ExportAuthExcelController < ApplicationController
  def index
    if params[:search]
      @authors = Author.all.includes(:books)
        .search_name(params[:search]).order created_at: :desc
    else
      @authors = Author.select(:id, :name).includes(:books)
        .order created_at: :desc
    end
    respond_to do |format|
      format.html
      format.xls{
        filename = t(".author_name_record") << "#{Time.now.strftime("%Y%m%d%H%M%S")}" << t(".xls")
        send_data(
          @authors.to_a.to_xls,
          type: "text/xls; charset=utf-8; header=present",
          filename: filename
        )
      }
    end
  end
end
