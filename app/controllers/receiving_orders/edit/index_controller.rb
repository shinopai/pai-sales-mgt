class ReceivingOrders::Edit::IndexController < ApplicationController
  before_action :authenticate_user!
  before_action :find_order

  def index
    render 'receiving_orders/edit/index'
  end

  def submit
    if @order.update(order_params)
      redirect_to receiving_orders_path, notice: "「伝票番号:#{@order.slip_no}」の情報を更新しました"
    else
      render 'receiving_orders/edit/index', status: :unprocessable_entity
    end
  end


  # private
  private
  def find_order
    @order = ReceivingOrder.find(params[:receiving_order_id])
  end

  def order_params
    params.require(:receiving_order).permit(:notes, :worker_id)
  end
end
