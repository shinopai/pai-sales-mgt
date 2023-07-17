module ApplicationHelper
  def is_current_page(path, str)
    path.include?(str)
  end
end
