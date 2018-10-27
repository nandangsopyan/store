class AddCategoryKeywordToCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :category_keyword, :string
  end
end
