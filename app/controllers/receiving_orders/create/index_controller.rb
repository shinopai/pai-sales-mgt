class ReceivingOrders::Create::IndexController < ApplicationController
  before_action :authenticate_user!
  before_action :find_item
  before_action :create_obj

  require 'date'

  def index
    render 'receiving_orders/create/index'
  end

  def submit
    @new_order = @item.receiving_orders.build

    # 一意の伝票番号生成
    max_value = ReceivingOrder.maximum('slip_no')

    if max_value.nil?
      slip_no = sprintf("%04d", 1)
    else
      slip_no = sprintf("%04d", max_value + 1)
    end

    @new_order.slip_no = slip_no
    @new_order.order_date = DateTime.now
    @new_order.notes = order_params[:notes]
    @new_order.client_id = order_params[:client_id]
    @new_order.worker_id = order_params[:worker_id]

    # 数量が在庫数を上回っていたらエラーメッセージを格納
    if order_params[:quantity].to_i > @item.stock
      @new_order.errors.add(:quantity, message: '数量は在庫数より小さい値を入力してください')
    else
      @new_order.quantity = order_params[:quantity]
    end

    if @new_order.valid?
      # 商品の在庫数から受注数を引く
      @item.stock = @item.stock - order_params[:quantity].to_i

      @item.save
      @new_order.save
      redirect_to receiving_orders_path, notice: '「' + @item.name + '」の受注が完了しました'
    else
        render 'receiving_orders/create/index', status: :unprocessable_entity
    end
  end


  # private method
  private

  def find_item
    @item = Item.find(params[:item_id])
  end

  def create_obj
    @order = ReceivingOrder.new
  end

  def order_params
    params.require(:receiving_order).permit(:quantity, :notes, :client_id, :worker_id)
  end
end
