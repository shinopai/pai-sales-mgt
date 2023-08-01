class Orders::Create::IndexController < ApplicationController
  before_action :authenticate_user!
  before_action :find_item
  before_action :create_obj

  require 'date'

  def index
    render 'orders/create/index'
  end

  def submit
    @new_order = @item.orders.build

    # 一意の伝票番号生成
    max_value = Order.maximum('slip_no')

    if max_value.nil?
      slip_no = 1
    else
      slip_no = max_value + 1
    end

    @new_order.slip_no = slip_no
    @new_order.order_date = DateTime.now
    @new_order.supplier_id = order_params[:supplier_id]
    @new_order.worker_id = order_params[:worker_id]

    # # 数量が在庫数を上回っていたらステータスを「受注(在庫無)」に変更
    # if receiving_order_params[:quantity].to_i > @item.stock
    #   @new_order.status = 2
    # end

    @new_order.quantity = order_params[:quantity]

    if @new_order.valid?
      # 商品の在庫数を変更
        @item.stock = order_params[:quantity].to_i

      @item.save
      @new_order.save
      redirect_to orders_path, notice: '「' + @item.name + '」の発注が完了しました'
    else
        render 'orders/create/index', status: :unprocessable_entity
    end
  end


  # private method
  private

  def find_item
    @item = Item.find(params[:item_id])
  end

  def create_obj
    @order = Order.new
  end

  def order_params
    params.require(:order).permit(:quantity, :supplier_id, :worker_id)
  end
end
