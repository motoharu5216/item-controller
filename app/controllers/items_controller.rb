class ItemsController < ApplicationController
  def index
    @items = Item.all
    @tags = Item.tag_counts_on(:tags).order('count DESC')
    items = @items
    @myitems = current_user.items
    if params[:tag_name]
      @myitems = Item.tagged_with("#{params[:tag_name]}")
    end
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path, notice: 'データを追加しました'
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    # @item = Item.find_by(id: params[:id])
  end

  def updata
    item = Item.find_by(params[:id])
    item.update(item_params)
    redirect_to("/")
  end

  def destroy
    Item.find_by(params[:id]).destroy
  end

  def search
    @items = Item.where('name LIKE(?)', "%#{params[:keyword]}%")
    respond_to do |format|
      format.html 
      format.json 
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :unit, :image, :count, :tag_list).merge(user_id: current_user.id)
  end
end
