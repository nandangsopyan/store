class AddProductKeywordToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :product_keyword, :string
  end
end
