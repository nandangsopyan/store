class AddImageToSiteIdentities < ActiveRecord::Migration[5.2]
  def change
    add_column :site_identities, :image, :string
  end
end
