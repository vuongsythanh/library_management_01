module ApplicationHelper
  def full_title page_title = ""
    base_title = t ".app_name_app"
    page_title.empty? ? base_title : page_title +  " | " + base_title
  end

  def index_continue object, index, per_page
    (object.to_i - 1) * per_page.to_i + index + 1
  end
end
