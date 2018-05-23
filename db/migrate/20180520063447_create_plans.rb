class CreatePlans < ActiveRecord::Migration[5.0]
  def change
    create_table :plans do |t|
      t.string :name
      t.date :touroku
      t.integer :hyouka
      t.date :jikai
      t.string :konkyo
      t.string :sihyo_1
      t.string :sihyo_2
      t.string :sihyo_3
      t.string :kanren_1
      t.string :kanren_2
      t.string :kanren_3
      t.string :mokuhyo_1
      t.string :mokuhyo_2
      t.string :mokuhyo_3
      t.string :mokuhyo_4
      t.string :mokuhyo_5
      t.integer :mhyouka_1
      t.integer :mhyouka_2
      t.integer :mhyouka_3
      t.integer :mhyouka_4
      t.integer :mhyouka_5
      t.date :mhyoud_1
      t.date :mhyoud_2
      t.date :mhyoud_3
      t.date :mhyoud_4
      t.date :mhyoud_5
      t.references :patient, foreign_key: true

      t.timestamps
    end
  end
end
