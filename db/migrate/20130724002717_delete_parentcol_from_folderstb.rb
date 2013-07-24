class DeleteParentcolFromFolderstb < ActiveRecord::Migration
  def change
    remove_column :folders, :parent
  end
end
