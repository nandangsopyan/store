class AddSpecificationToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :specification, :text
  end
end
