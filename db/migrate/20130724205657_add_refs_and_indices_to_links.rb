class AddRefsAndIndicesToLinks < ActiveRecord::Migration
  def change  
    change_table :links do |t|
      t.references :folder
    end
    add_index :links, :folder_id
  end
end
