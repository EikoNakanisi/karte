class CreatePdetails < ActiveRecord::Migration[5.0]
  def change
    create_table :pdetails do |t|
      t.integer :kubun
      t.string :naiyo
      t.integer :hyouka
      t.date :hyokad
      t.references :plan, foreign_key: true

      t.timestamps
    end
  end
end
