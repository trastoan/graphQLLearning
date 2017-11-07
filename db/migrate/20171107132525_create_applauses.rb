class CreateApplauses < ActiveRecord::Migration[5.1]
  def change
    create_table :applauses do |t|
      t.references :performance, foreign_key: true
      t.references :artist, foreign_key: true

      t.timestamps
    end
  end
end
