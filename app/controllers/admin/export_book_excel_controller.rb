class Admin::ExportBookExcelController < ApplicationController
  before_action :verify_admin?
  def index
    if params[:search]
      @books = Book.all.search_name(params[:search]).order created_at: :desc
    else
      @books = Book.select(:id, :title, :image, :status,
        :category_id, :publisher_id, :author_id).order created_at: :desc
    end
    respond_to do |format|
      format.html
      format.xls{
        filename = t(".book_name_record") << "#{Time.now.strftime(Settings
          .export_auth_excel.date_time)}" << t(".xls")
        send_data(
          @books.to_a.to_xls,
          type: "text/xls; charset=utf-8; header=present",
          filename: filename
        )
      }
    end
  end
end
