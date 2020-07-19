class ItemsController < ApplicationController
  before_action :set_item, only: [:confirm, :show]

  def index
    @items = Item.last(4)
    @brandItems = Item.where(brand: "ABC")
  end

  def new
    @item = Item.new
    @item.images.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
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

  private

def item_params
  params.require(:item).permit(:name, :price, images_attributes: [:src])
end

end
