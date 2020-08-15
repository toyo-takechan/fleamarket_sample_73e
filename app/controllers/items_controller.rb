class ItemsController < ApplicationController
  before_action :set_item, only: [:confirm, :show, :edit, :update]
  before_action :set_parent_category
  before_action :set_parent_array, only: [:new, :create, :edit, :update]

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
      @item.images.new
      set_children_and_grandchildren_array_and_parent_category
      render :new
    end
  end

  def edit
    if current_user && current_user.id != @item.seller_id
      redirect_to root_path
    end
    set_children_and_grandchildren_array_and_parent_category
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      flash.now[:alert] = '正しく入力してください。'
      set_children_and_grandchildren_array_and_parent_category
      render 'items/edit'
    end
  end

  def destroy
    if @item.destroy(item_params)
      redirect_to root_path
    else
      redirect_to :edit
    end
  end

  def confirm
  end

  def show
    @items = Item.all
    @relatedItems = Item.where(category_id: @item.category_id).where.not(id: params[:id]).order("RAND()").limit(3)
    @seller = User.find_by(id: @item.seller_id)
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find(params[:child_id]).children
  end
  
  def get_category_children
    @category_children = Category.find(params[:parent_id]).children
  end


  private


  def set_item
    @item = Item.find(params[:id])
  end
  
  def set_parent_array
    @category_parent_array = []
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent
    end
  end

  def set_parent_category
    @parents = Category.where(ancestry: nil)
  end

  def set_children_and_grandchildren_array_and_parent_category
    if @item.category
      @grandchild_category = @item.category
      @child_category = @grandchild_category.parent
      @parent_category = @grandchild_category.root

      @child_category_array = []
      @item.category.parent.siblings.each do |children|
        @child_category_array << children
      end

      @grandchild_category_array = []
      @item.category.siblings.each do |grandchildren|
        @grandchild_category_array << grandchildren
      end
    end
  end


  def item_params
    params.require(:item).permit(:name, :content, :brand, :category_id, :condition, :postage_payer, :postage_type, :prefecture_id, :preparation_day, :price, images_attributes: [:image_url, :_destroy, :id]).merge(seller_id: current_user.id)
  end

end
