class ReceivingOrders::IndexController < ApplicationController
  before_action :authenticate_user!

  def index
    @results = ReceivingOrder.all.page(params[:page])

    # 売り上げの合計を算出
    arr = []
    @results.each do |result|
      arr.push(result.quantity * result.item.price)
    end

    @total_sales = arr.sum

    render 'receiving_orders/index'
  end
end
