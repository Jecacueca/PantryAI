class ItemsController < ApplicationController
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
    raise
    if @item.save
      redirect_to pantry_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :quantity, :threshold)
  end
end
