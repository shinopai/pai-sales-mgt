class Items::Edit::IndexController < ApplicationController
  before_action :authenticate_user!
  before_action :find_item

  def index
    render 'items/edit/index'
  end

  def submit
    if @item.update(item_params)
      redirect_to items_path, notice: '商品情報を更新しました'
    else
      render 'items/edit/index'
    end
  end


  # private
  private
  def find_item
    @item = Item.find(params[:item_id])
  end

  def item_params
    params.require(:item).permit(:name, :price, :stock)
  end
end
