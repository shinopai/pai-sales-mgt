class Orders::IndexController < ApplicationController
  before_action :authenticate_user!
  before_action :set_q

  def index
    @results = Order.all.page(params[:page])

    render 'orders/index'
  end

  def search
    @results = @q.result(stock: 0).order(id: :desc).page(params[:page])

    render 'orders/search'
  end


  # private
  private
  def set_q
    @q = Order.ransack(params[:q])
  end
end
