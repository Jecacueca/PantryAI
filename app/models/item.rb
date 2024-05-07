class Item < ApplicationRecord
  belongs_to :pantry
  belongs_to :shopping_list
end
