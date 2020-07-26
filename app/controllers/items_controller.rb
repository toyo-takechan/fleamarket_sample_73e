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
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    if @product.update(product_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  # 親カテゴリーが選択された後に動くアクション
  def get_category_children
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  # 子カテゴリーが選択された後に動くアクション。 ajaxからハッシュで子要素のIDを受け取る{child_id: childId}
  def get_category_grandchildren
    #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
    @category_grandchildren = Category.find("#{params[:child_id]}").children
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
    params.require(:item).permit(:name, :content, :brand, :condition, :postage_payer, :postage_type, :prefecture_id, :preparation_day, :price, images_attributes: [:src])
  end

end
