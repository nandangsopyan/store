class ChangeUpdateAtToUpdatedAtAtProducts < ActiveRecord::Migration[5.2]
  def change
    rename_column :products, :update_at, :updated_at
  end
end
