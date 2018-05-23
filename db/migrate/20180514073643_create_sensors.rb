class CreateSensors < ActiveRecord::Migration[5.0]
  def change
    create_table :sensors do |t|
      t.string :datatype
      t.integer :data

      t.timestamps
    end
  end
end
