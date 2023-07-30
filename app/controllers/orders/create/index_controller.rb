class Orders::Create::IndexController < ApplicationController
  before_action :authenticate_user!
  before_action :find_item
  before_action :create_obj

  require 'date'

  def index
    render 'orders/create/index'
  end


  # private method
  private

  def find_item
    @item = Item.find(params[:item_id])
  end

  def create_obj
    @order = Order.new
  end
end
