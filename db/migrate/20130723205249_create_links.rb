class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :name
      t.string :url
      t.string :notes
      t.string :folder
      t.string :subfolder

      t.timestamps
    end
  end
end
