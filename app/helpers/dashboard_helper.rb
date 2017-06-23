module DashboardHelper
  def load_category_size
    @category_size = Category.all.size
  end

  def load_publisher_size
    @publisher_size = Publisher.all.size
  end

  def load_user_size
    @user_size = User.all.size
  end

  def load_author_size
    @author_size = Author.all.size
  end
end
