class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.integer :quantity
      t.integer :threshold
      t.references :pantry, foreign_key: true
      t.references :shopping_list, foreign_key: true

      t.timestamps
    end
  end
end
