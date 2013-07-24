class AddParentColumnToFolders < ActiveRecord::Migration
  def change
    add_column :folders, :parent, :string
  end
end
