class AddTrackColumns < ActiveRecord::Migration
  def change
    add_column :tracks, :bonus, :boolean
    change_column :tracks, :bonus, :boolean, :null => false
    
    add_column :tracks, :lyrics, :text
    change_column :tracks, :lyrics, :text, :null => false
  end
end
