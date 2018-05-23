class Saiketu < ApplicationRecord
  belongs_to :patient

validates :koumoku,    length: { maximum: 20 }
validates :kekka_m,    length: { maximum: 2 }
validates :tani,    length: { maximum: 10 }


  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << csv_column_names
      all.each do |saiketu|
        csv << saiketu.csv_column_values
      end
    end
  end

  def self.csv_column_names
    ["ID", "採取日", "検査項目", "結果", "H/L", "下限値", "上限値", "単位", "患者id"]
  end

  def csv_column_values
    [id,tori_day,koumoku,kekka,kekka_m,sita,ue,tani,patient_id]
  end


  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      # IDが見つかれば、レコードを呼び出し、見つかれなければ、新しく作成
      saiketu = find_by(id: row["id"]) || new
      # CSVからデータを取得し、設定する
      saiketu.attributes = row.to_hash.slice(*updatable_attributes)
      # 保存する
      saiketu.save!
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
    ["tori_day","koumoku","kekka","kekka_m","sita","ue","tani","patient_id"]
  end


end
