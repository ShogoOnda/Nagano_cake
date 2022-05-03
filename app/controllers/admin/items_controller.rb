class Admin::ItemsController < ApplicationController

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(image_params)
    if @item.save
      redirect_to admin_item_path(@item.id)
    else
      @items = Item.all
      render :index
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(image_params)
      redirect_to admin_items_path, notice: 'You have updated book successfully.'
    else
      render :edit
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def index
    @items = Item.page(params[:page])
  end

  private

  def image_params
    params.require(:item).permit(:image, :name, :introduction, :genre_id, :price, :is_active)
  end
end
