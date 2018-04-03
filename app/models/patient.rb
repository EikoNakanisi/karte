class Patient < ApplicationRecord
  has_many :kansatus
  
validates :p_name,    length: { maximum: 20 }
validates :p_kana,    length: { maximum: 20 }
validates :room_no,    length: { maximum: 10 }
validates :diagnosis,    length: { maximum: 250 }
validates :med_history,    length: { maximum: 250 }
validates :infection,    length: { maximum: 50 }
validates :allergic,    length: { maximum: 50 }
validates :attention,    length: { maximum: 50 }
validates :post,    length: { maximum: 250 }
validates :address,    length: { maximum: 50 }
validates :wish,    length: { maximum: 80 }
validates :notice,    length: { maximum: 20 }
validates :recognition,    length: { maximum: 50 }
validates :vision,    length: { maximum: 50 }
validates :hearing,    length: { maximum: 50 }
validates :verbal,    length: { maximum: 50 }
validates :skin,    length: { maximum: 50 }
validates :excretion,    length: { maximum: 50 }
validates :iadl,    length: { maximum: 250 }
validates :consciousness,    length: { maximum: 50 }
validates :understanding,    length: { maximum: 50 }
validates :keyp1,    length: { maximum: 20 }
validates :connection,    length: { maximum: 20 }
validates :family,    length: { maximum: 250 }
validates :house,    length: { maximum: 250 }
validates :impact,    length: { maximum: 250 }
validates :relationship,    length: { maximum: 250 }
validates :friend,    length: { maximum: 250 }
validates :occupation,    length: { maximum: 50 }
validates :position,    length: { maximum: 50 }
validates :good_p,    length: { maximum: 50 }
validates :bad_p,    length: { maximum: 50 }
validates :value,    length: { maximum: 250 }
validates :hobby,    length: { maximum: 250 }
validates :anniversary,    length: { maximum: 250 }
validates :fa_prob,    length: { maximum: 250 }

def age
  date_format = "%Y%m%d"
  (Date.today.strftime(date_format).to_i - birth_date.strftime(date_format).to_i) / 10000
end

enum gender: {男:0, 女:1}
enum bloodtype: {Ａ:0, Ｂ:1, Ｏ:2, ＡＢ:3}
enum aid: {独歩:0, 護送:1, 担送:2}
enum hand_mmt: {０筋収縮なし:0, １わずかに筋収縮あり:1, ２重力を除けば全可動域動く:2, ３抵抗をくわえなければ重力に打ち勝って完全に動く:3, ４いくらか抵抗を加えてもなお重力にうちかって完全に動く:4, ５強い抵抗を加えてもなお重力にうちかって完全に動く:5}
enum foot_mmt: {０足筋収縮なし:0, １足わずかに筋収縮あり:1, ２足重力を除けば全可動域動く:2, ３足抵抗をくわえなければ重力に打ち勝って完全に動く:3, ４足いくらか抵抗を加えてもなお重力にうちかって完全に動く:4, ５足強い抵抗を加えてもなお重力にうちかって完全に動く:5}

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << csv_column_names
      all.each do |patient|
        csv << patient.csv_column_values
      end
    end
  end

  def self.csv_column_names
    ["id","患者名","カナ","入院日","部屋番号","誕生日","性別","診断名","既往","血液型",
"身長","体重","感染症","アレルギー","救護区分","注意事項","掲示板","住所","希望",
"告知","病識","１日の生活","ＰＳ","手ＭＭＴ","足ＭＭＴ",
"視力","聴力","言語","皮膚","排泄","ＩＡＤＬ","意識レベル",
"理解力","キーパーソン","続柄","家族構成","居住環境",
"家族に与える影響","家族内での役割人間関係","対人関係","職業","地位役割",
"長所","短所","価値観","趣味","記念日","家族問題"]
  end

  def csv_column_values
    [id,p_name,p_kana,hos_date,room_no,birth_date,gender,
    diagnosis,med_history,bloodtype,height,weight,infection,
    allergic,aid,attention,post,address,wish,notice,recognition,
    life,ps,hand_mmt,foot_mmt,vision,hearing,verbal,skin,excretion,
    iadl,consciousness,understanding,keyp1,connection,family,house,impact,
    relationship,friend,occupation,position,good_p,bad_p,value,hobby,
    anniversary,fa_prob
    ]
  end


def self.import(file)
  spreadsheet = Roo::Spreadsheet.open(file.path)
  header = spreadsheet.row(1)
  (2..spreadsheet.last_row).each do |i|
    row = Hash[[header, spreadsheet.row(i)].transpose]
    patient = find_by(id: row["id"]) || new
    patient.attributes = row.to_hash
    patient.save!
  end
end 

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
    when ".csv" then Roo::CSV.new(file.path, nil, :ignore)
    when ".xls" then Roo::Excel.new(file.path, nil, :ignore)
    when ".xlsx" then Roo::Excelx.new(file.path, nil, :ignore)
    when '.ods'  then Roo::OpenOffice.new(file.path, nil, :ignore)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end

  # 更新を許可するカラムを定義
  def self.updatable_attributes
["p_name","p_kana","hos_date","room_no","birth_date","gender",
"diagnosis","med_history","bloodtype","height","weight","infection",
"allergic","aid","attention","post","address","wish",
"notice","recognition","life","ps","hand_mmt","foot_mmt","vision","hearing",
"verbal","skin","excretion","iadl","consciousness","understanding","keyp1",
"connection","family","house","impact","relationship","friend","occupation",
"position","good_p","bad_p","value","hobby","anniversary","fa_prob"]
  end


end
