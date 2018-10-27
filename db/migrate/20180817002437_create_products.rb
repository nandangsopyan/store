class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :title
      t.string :price
      t.text :description
      t.datetime :created_at
      t.datetime :update_at
    end
  end
end
