class CreateApplauses < ActiveRecord::Migration[5.1]
  def change
    create_table :applauses do |t|
      t.references :performance, foreign_key: true
      t.reference :artist

      t.timestamps
    end
  end
end
