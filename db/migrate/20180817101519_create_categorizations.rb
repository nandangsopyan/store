class CreateCategorizations < ActiveRecord::Migration[5.2]
  def change
    create_table :categorizations do |t|
      t.integer :product_id
      t.integer :category_id
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
