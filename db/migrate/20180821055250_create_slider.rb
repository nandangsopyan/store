class CreateSlider < ActiveRecord::Migration[5.2]
  def change
    create_table :sliders do |t|
      t.string :name
      t.string :image
      t.string :url
    end
  end
end
