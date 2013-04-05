class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :name, :null => false
      t.integer :album_id, :null => false
      t.integer :ord, :null => false
      
      t.timestamps
    end
    
    add_index :tracks, [:album_id, :ord], :unique => true
  end
end
