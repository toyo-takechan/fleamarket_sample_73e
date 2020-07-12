class ItemsController < ApplicationController
  def index
    @items = Item.first(4)
    @brandItems = Item.where(brand: "ABC")
  end

  def confirm
    @item = Item.find(params[:id])
  end
  
  def show
    @item = Item.find(params[:id])
    @relatedItems = Item.where(category_id: @item.category_id)
    @lastItem = Item.last
  end

  
end
