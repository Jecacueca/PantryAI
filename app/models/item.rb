class Item < ApplicationRecord
  belongs_to :pantry, optional: true
  belongs_to :shopping_list, optional: true
  validates :name, presence: true
  validates :quantity, presence: true
  validates :threshold, presence: true
  validate :must_have_pantry_or_shopping_list

  private

  def must_have_pantry_or_shopping_list
    if pantry.nil? && shopping_list.nil?
      errors.add(:base, "must be associated to a pantry or shopping list")
    end
  end

end
