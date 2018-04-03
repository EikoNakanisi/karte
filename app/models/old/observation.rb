class Observation < ApplicationRecord

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
      all.each do |observation|
        csv << observation.csv_column_values
      end
    end
  end

  def self.csv_column_names
    ["ID", "category", "観察名", "日勤1day", "準夜1day", "深夜2day", "日勤2day", "準夜2day", "深夜3day", "日勤3day", "準夜3day", "深夜4day", "患者id"]
  end

  def csv_column_values
    [id,category,ob_name,n_1d,j_1d,s_2d,n_2d,j_2d,s_3d,n_3d,j_3d,s_4d,pt_no]
  end


def self.import(file)
  spreadsheet = Roo::Spreadsheet.open(file.path)
  header = spreadsheet.row(1)
  (2..spreadsheet.last_row).each do |i|
    row = Hash[[header, spreadsheet.row(i)].transpose]
    observation = find_by(id: row["id"]) || new
    observation.attributes = row.to_hash
    observation.save!
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
    ["category","ob_name","n_1d","j_1d","s_2d","n_2d","j_2d","s_3d","n_3d","j_3d","s_4d","pt_no"]
  end




end




