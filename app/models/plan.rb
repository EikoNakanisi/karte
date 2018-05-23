class Plan < ApplicationRecord
  belongs_to :patient
  has_many :pdetails
validates :name,    length: { maximum: 20 }
validates :konkyo,    length: { maximum: 200 }
validates :sihyo_1,    length: { maximum: 100 }
validates :sihyo_2,    length: { maximum: 100 }
validates :sihyo_3,    length: { maximum: 100 }
validates :kanren_1,    length: { maximum: 100 }
validates :kanren_2,    length: { maximum: 100 }
validates :kanren_3,    length: { maximum: 100 }
validates :mokuhyo_1,    length: { maximum: 50 }
validates :mokuhyo_2,    length: { maximum: 50 }
validates :mokuhyo_3,    length: { maximum: 50 }
validates :mokuhyo_4,    length: { maximum: 50 }
validates :mokuhyo_5,    length: { maximum: 50 }

enum hyouka: {続行:0, 解決:1, 中止:2}
enum mhyouka_1: {続行１:0, 解決１:1, 中止１:2}
enum mhyouka_2: {続行２:0, 解決２:1, 中止２:2}
enum mhyouka_3: {続行３:0, 解決３:1, 中止３:2}
enum mhyouka_4: {続行４:0, 解決４:1, 中止４:2}
enum mhyouka_5: {続行５:0, 解決５:1, 中止５:2}


end
