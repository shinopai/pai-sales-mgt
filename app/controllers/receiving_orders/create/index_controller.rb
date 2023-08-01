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
      slip_no = 1
    else
      slip_no = max_value + 1
    end

    @new_order.slip_no = slip_no
    @new_order.order_date = DateTime.now
    @new_order.notes = receiving_order_params[:notes]
    @new_order.client_id = receiving_order_params[:client_id]
    @new_order.worker_id = receiving_order_params[:worker_id]

    # 数量が在庫数を上回っていたらステータスを「受注(在庫無)」に変更
    if receiving_order_params[:quantity].to_i > @item.stock
      @new_order.status = 2
    end

    @new_order.quantity = receiving_order_params[:quantity]

    if @new_order.valid?
      # 商品の在庫数から受注数を引く(在庫が足りている場合)
      if receiving_order_params[:quantity].to_i >= @item.stock
        @item.stock = @item.stock - receiving_order_params[:quantity].to_i
      end

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

  def receiving_order_params
    params.require(:receiving_order).permit(:quantity, :notes, :client_id, :worker_id)
  end
end
