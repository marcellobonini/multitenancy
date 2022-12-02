class AddSlugToGyms < ActiveRecord::Migration[7.0]
  def change
    add_column :gyms, :slug, :string
    add_index :gyms, :slug, unique: true
  end
end
