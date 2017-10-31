class CreateArtists < ActiveRecord::Migration[5.1]
  def change
    create_table :artists do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :about

      t.timestamps
    end
  end
end
