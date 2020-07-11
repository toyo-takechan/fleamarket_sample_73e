class ItemsController < ApplicationController
  def index
  end

  def confirm
  end
  
  def show
    @item = Item.find(params[:id])
  end

  
end
