class RenameParentToParentname < ActiveRecord::Migration
  def change
    rename_column :folders, :parent, :parentname
  end
end
