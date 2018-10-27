class CreateSiteIdentities < ActiveRecord::Migration[5.2]
  def change
    create_table :site_identities do |t|
      t.string :site_name
      t.string :site_description
      t.string :site_meta

      t.timestamps
    end
  end
end
