class AddImageAltToSliders < ActiveRecord::Migration[5.2]
  def change
    add_column :sliders, :image_alt, :string
  end
end
