class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  def index
    @items = current_vendor.items.all
    respond_to do |format|
      format.html
    end
  end

  def show
    respond_to do |format|
      format.html
    end
  end

  def new
    @item = Item.new
  end

  def edit
  end

  def create
    @item = Item.new(item_params) do |item|
      item.vendor = current_vendor
    end

    respond_to do |format|
      if @item.save
        format.html { redirect_to items_path, notice: 'Item was successfully created.' }
        format.js
      else
        format.html { render action: 'new' }
        format.js
      end
    end
  end

  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to items_path, notice: 'item was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url }
    end
  end

  private
  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :number_of_items, :avatar, :description, :price)
  end

end
