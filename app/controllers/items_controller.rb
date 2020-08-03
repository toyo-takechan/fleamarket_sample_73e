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
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path, notice: '出品が完了しました'
    else
      flash.now[:alert] = '正しく入力してください。'
      render :new
    end
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
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
    params.require(:item).permit(:name, :content, :brand, :category_id, :condition, :postage_payer, :postage_type, :prefecture_id, :preparation_day, :price, images_attributes: [:image_url]).merge(seller_id: current_user.id)
  end

end
