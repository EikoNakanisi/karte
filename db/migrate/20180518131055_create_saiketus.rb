class CreateSaiketus < ActiveRecord::Migration[5.0]
  def change
    create_table :saiketus do |t|
      t.datetime :tori_day
      t.string :koumoku
      t.float :kekka
      t.string :kekka_m
      t.float :sita
      t.float :ue
      t.string :tani
      t.references :patient, foreign_key: true

      t.timestamps
    end
  end
end
