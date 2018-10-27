class CreateStoreProfile < ActiveRecord::Migration[5.2]
  def change
    create_table :store_profiles do |t|
      t.text :about
      t.text :contact
    end
  end
end
