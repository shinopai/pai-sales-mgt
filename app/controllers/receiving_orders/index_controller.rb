class ReceivingOrders::IndexController < ApplicationController
  before_action :authenticate_user!

  def index
    @results = ReceivingOrder.all

    render 'receiving_orders/index'
  end
end
