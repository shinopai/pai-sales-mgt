class Items::IndexController < ApplicationController
  before_action :authenticate_user!
  before_action :set_q

  def index
    @results = Item.order(id: :desc).page(params[:page])

    render 'items/index'
  end

  def search
    if params[:q][:stock] == 1
      @results = @q.result(stock: 0).order(id: :desc).page(params[:page])
    else
      @results = @q.result.order(id: :desc).page(params[:page])
    end

    render 'items/search'
  end


  # private
  private
  def set_q
    @q = Item.ransack(params[:q])
  end
end
