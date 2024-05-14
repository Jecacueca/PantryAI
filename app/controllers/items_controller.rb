class ItemsController < ApplicationController
  before_action :find_item, only: [:edit, :update, :destroy, :add_to_list]

  def new
    @existing_items = current_user.pantry.items.where(shopping_list: nil)
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if params[:previous_page].include? "/my_pantry"
      @item.pantry = current_user.pantry
      below_threshold?
    elsif params[:previous_page].include? "/shopping_list"
      if params[:item][:id]
        @item = Item.find(params[:item][:id])
      end
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
    if (request.referer.include? "/shopping_list") && @item.pantry
      @item.shopping_list = nil
      @item.save
    else
      @item.destroy
    end
    redirect_to request.referer
  end

  def add_to_list
    @item.shopping_list = current_user.shopping_list
    if @item.save
      redirect_to request.referer
      flash[:notice] = "Item added to shopping list"
    end
  end

  private

  def find_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :description, :quantity, :threshold)
  end

  def below_threshold?
    @item.shopping_list = current_user.shopping_list if @item.quantity <= @item.threshold
  end

  # def remove_from_list
  #   if request.referer.include? "/shopping_list"
  #     @item.shopping_list = nil
  #   else
  #     @§item.pantry = nil
  #   end
  # end
end
