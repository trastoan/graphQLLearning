class CreatePerformances < ActiveRecord::Migration[5.1]
  def change
    create_table :performances do |t|
      t.string :title
      t.string :place
      t.text :about

      t.timestamps
    end
  end
end
