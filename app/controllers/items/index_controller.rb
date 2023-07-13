class Items::IndexController < ApplicationController
  def index
    @results = Item.all

    render 'items/index'
  end
end
