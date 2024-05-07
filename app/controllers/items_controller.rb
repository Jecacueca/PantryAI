class ItemsController < ApplicationController
  before_action :find_item, only: [:edit, :update]

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if params[:previous_page].include? "/my_pantry"
      @item.pantry = current_user.pantry
    elsif params[:previous_page].include? "/shopping_list"
      @item.shopping_list = current_user.shopping_list
    end
    if @item.save
      redirect_to pantry_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to pantry_path
    else
      render :edit
    end
  end

  private

  def find_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :description, :quantity, :threshold)
  end
end
