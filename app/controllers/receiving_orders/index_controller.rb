class ReceivingOrders::IndexController < ApplicationController
  def index
    @results = ReceivingOrder.all

    render 'receiving_orders/index'
  end
end
