class ItemsController < ApplicationController
  def index
    @items = Item.last(4)
    @brandItems = Item.where(brand: "ABC")
  end

  def confirm
    @item = Item.find(params[:id])
  end
  
  def show
    @items = Item.all
    @item = Item.find(params[:id])
    @relatedItems = Item.where(category_id: @item.category_id).where.not(id: params[:id]).order("RAND()").limit(3)
  end

  
end
