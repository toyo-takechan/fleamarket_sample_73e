class ItemsController < ApplicationController
  def index
    @items = Item.first(4)
    @brandItems = Item.where(brand: "ABC")
  end

  def confirm
  end
  
  def show
    @item = Item.find(params[:id])
    @relatedItems = Item.where(category_id: @item.category_id)
  end

  
end
