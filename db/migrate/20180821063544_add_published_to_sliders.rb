class AddPublishedToSliders < ActiveRecord::Migration[5.2]
  def change
    add_column :sliders, :published, :integer
  end
end
