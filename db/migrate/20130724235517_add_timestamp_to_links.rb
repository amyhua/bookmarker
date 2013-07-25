class AddTimestampToLinks < ActiveRecord::Migration
  def change
    add_column :links, :timestamp, :int
  end
end
