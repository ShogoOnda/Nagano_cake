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

  def show
    @item = Item.find(params[:id])
  end

  def index
    @items = Item.all
  end

  private

  def item_images_params
    params.require(:item).permit(:images, :name, :introduction, :genre, :price, :is_active)
  end
end
