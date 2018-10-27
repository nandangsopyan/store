class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :name
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
