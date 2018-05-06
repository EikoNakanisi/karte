class Tentou < ApplicationRecord
validates :yobou,    length: { maximum: 250 }
enum kikendo: {Ⅰ:1, Ⅱ:2,Ⅲ:3}

def goukei
  age + kiou + katudou + ninsiki + haisetu + med1 + med2 + med3 + med4 + med5 + kankyo1 + kankyo2
end


  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << csv_column_names
      all.each do |tentou|
        csv << tentou.csv_column_values
      end
    end
  end

  def self.csv_column_names
    ["ID", "患者ID", "記載日", "年齢","既住歴","活動領域","認識力","排泄","麻薬","抗精神薬","下剤","睡眠安定剤","降圧利尿剤","環境","点滴酸素" ,"合計","予防策"]
  end

  def csv_column_values
    [id,patient_id,kisaibi,age,kiou,katudou,ninsiki,haisetu,med1,med2,med3,med4,med5,kankyo1,kankyo2,goukei,yobou]
  end


  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      # IDが見つかれば、レコードを呼び出し、見つかれなければ、新しく作成
      tentou = find_by(id: row["id"]) || new
      # CSVからデータを取得し、設定する
      tentou.attributes = row.to_hash.slice(*updatable_attributes)
      # 保存する
      tentou.save!
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
    ["patient_id","kisaibi","age","kiou","katudou","ninsiki","haisetu","med1","med2","med3","med4","med5","kankyo1","kankyo2","goukei","yobou"]
  end



end
