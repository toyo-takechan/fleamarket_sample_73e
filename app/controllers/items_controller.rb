class ItemsController < ApplicationController
  before_action :set_item, only: [:confirm, :show]

  def index
    @items = Item.last(4)
    @brandItems = Item.where(brand: "ABC")
  end

  def confirm
  end
  
  def show
    @items = Item.all
    @relatedItems = Item.where(category_id: @item.category_id).where.not(id: params[:id]).order("RAND()").limit(3)
  end

  
  def set_item
    @item = Item.find(params[:id])
  end

  def new
  end

end
