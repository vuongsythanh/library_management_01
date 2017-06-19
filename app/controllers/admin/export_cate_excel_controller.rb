class Admin::ExportCateExcelController < ApplicationController
  def index
    if params[:search]
      @categories = Category.all.includes(:books)
        .search_name(params[:search]).order created_at: :desc
    else
      @categories = Category.select(:id, :name).includes(:books)
        .order created_at: :desc
    end
    respond_to do |format|
      format.xls{
        filename = t(".category_name_record") << "#{Time.now.strftime(Settings
          .export_auth_excel.date_time)}" << t(".xls")
        send_data(
          @categories.to_a.to_xls,
          type: "text/xls; charset=utf-8; header=present",
          filename: filename
        )
      }
    end
  end
end
