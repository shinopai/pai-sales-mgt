module Items::IndexHelper
  def show_total_amount(price, stock)
    price * stock
  end
end
