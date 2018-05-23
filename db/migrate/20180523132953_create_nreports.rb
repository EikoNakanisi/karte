class CreateNreports < ActiveRecord::Migration[5.0]
  def change
    create_table :nreports do |t|
      t.references :patient, foreign_key: true
      t.text :nrs
      t.text :nro
      t.text :nra
      t.text :nrp
      t.datetime :nrt
      t.integer :nrn
      t.string :nrm

      t.timestamps
    end
  end
end
