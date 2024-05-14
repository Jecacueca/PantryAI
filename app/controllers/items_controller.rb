class ItemsController < ApplicationController
  before_action :find_item, only: [:edit, :update, :destroy]

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
      redirect_to params[:previous_page]
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to params[:previous_page]
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to request.referer
  end

  private

  def find_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :description, :quantity, :threshold)
  end
end
