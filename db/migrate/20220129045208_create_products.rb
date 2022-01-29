class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|

      t.timestamps
      t.string :name
      t.text :description
      t.integer :price
      t.references :category, foreign_key: true

    end
  end
end
