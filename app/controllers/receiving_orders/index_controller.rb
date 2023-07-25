class ReceivingOrders::IndexController < ApplicationController
  before_action :authenticate_user!
  before_action :set_q

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

  def search
    @results = @q.result(stock: 0).order(id: :desc).page(params[:page])

    # 売り上げの合計を算出
    arr = []
    @results.each do |result|
      arr.push(result.quantity * result.item.price)
    end

    @total_sales = arr.sum

    render 'receiving_orders/search'
  end


  # private
  private
  def set_q
    @q = ReceivingOrder.ransack(params[:q])
  end
end
