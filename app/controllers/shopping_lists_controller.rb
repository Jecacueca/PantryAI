class ShoppingListsController < ApplicationController
  def show
    @shopping_list = current_user.shopping_list
  end
end
