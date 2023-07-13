class Items::IndexController < ApplicationController
  def index
    @results = Item.order(id: :desc).page(params[:page])

    render 'items/index'
  end
end
