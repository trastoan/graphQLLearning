class AddArtistIdLink < ActiveRecord::Migration[5.1]
  def change
  	change_table :performances do |t|
		t.references :artist, foreign_key: true
	end
  end
end