class Kansatu < ApplicationRecord
belongs_to :patient

validates :category,    length: { maximum: 50 }
validates :ob_name,    length: { maximum: 50 }
validates :n_1d,    length: { maximum: 50 }
validates :j_1d,    length: { maximum: 50 }
validates :s_2d,    length: { maximum: 50 }
validates :n_2d,    length: { maximum: 50 }
validates :j_2d,    length: { maximum: 50 }
validates :s_3d,    length: { maximum: 50 }
validates :n_3d,    length: { maximum: 50 }
validates :j_3d,    length: { maximum: 50 }
validates :s_4d,    length: { maximum: 50 }


  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << csv_column_names
      all.each do |kansatu|
        csv << kansatu.csv_column_values
      end
    end
  end

  def self.csv_column_names
    ["ID", "category", "観察名", "日勤1day", "準夜1day", "深夜2day", "日勤2day", "準夜2day", "深夜3day", "日勤3day", "準夜3day", "深夜4day", "患者id"]
  end

  def csv_column_values
    [id,category,ob_name,n_1d,j_1d,s_2d,n_2d,j_2d,s_3d,n_3d,j_3d,s_4d,patient_id]
  end


  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      # IDが見つかれば、レコードを呼び出し、見つかれなければ、新しく作成
      kansatu = find_by(id: row["id"]) || new
      # CSVからデータを取得し、設定する
      kansatu.attributes = row.to_hash.slice(*updatable_attributes)
      # 保存する
      kansatu.save!
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
    ["category","ob_name","n_1d","j_1d","s_2d","n_2d","j_2d","s_3d","n_3d","j_3d","s_4d","patient_id"]
  end


end
