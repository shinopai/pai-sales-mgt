module ReceivingOrders::IndexHelper
  def show_total_order_amount(price, quantity)
    number_to_currency(price * quantity)
  end
end
