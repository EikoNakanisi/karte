class CreatePatients < ActiveRecord::Migration[5.0]
  def change
    create_table :patients do |t|
      t.string :p_name
      t.string :p_kana
      t.datetime :hos_date
      t.string :room_no
      t.date :birth_date
      t.integer :age
      t.integer :gender
      t.string :diagnosis
      t.string :med_history
      t.integer :bloodtype
      t.float :height
      t.float :weight
      t.string :infection
      t.string :allergic
      t.integer :aid
      t.string :attention
      t.string :post
      t.string :address
      t.string :wish
      t.string :notice
      t.string :recognition
      t.string :life
      t.integer :ps
      t.integer :hand_mmt
      t.integer :foot_mmt
      t.string :vision
      t.string :hearing
      t.string :verbal
      t.string :skin
      t.string :excretion
      t.string :iadl
      t.string :consciousness
      t.string :understanding
      t.string :keyp1
      t.string :connection
      t.string :family
      t.string :house
      t.string :impact
      t.string :relationship
      t.string :friend
      t.string :occupation
      t.string :position
      t.string :good_p
      t.string :bad_p
      t.string :value
      t.string :hobby
      t.string :anniversary
      t.string :fa_prob

      t.timestamps
    end
  end
end
