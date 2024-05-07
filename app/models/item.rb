class Item < ApplicationRecord
  belongs_to :pantry
  belongs_to :shopping_list
  validates :name, presence: true
  validates :quantity, presence: true
  validates :threshold, presence: true
end
