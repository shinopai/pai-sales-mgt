module ApplicationHelper
  def is_current_page(path, str)
    path.match(/\/#{str}(\/)?/)
  end
end
