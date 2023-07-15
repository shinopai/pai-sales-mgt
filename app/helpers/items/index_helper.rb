module Items::IndexHelper
  def show_total_amount(price, stock)
    number_to_currency(price * stock)
  end
end
