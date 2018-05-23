class Pdetail < ApplicationRecord
  belongs_to :plan
validates :naiyo,    length: { maximum: 200 }
enum kubun: {ＯＰ:0, ＴＰ:1, ＥＰ:2}
enum hyouka: {続行:0, 解決:1, 中止:2}

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      # IDが見つかれば、レコードを呼び出し、見つかれなければ、新しく作成
      pdetail = find_by(id: row["id"]) || new
      # CSVからデータを取得し、設定する
      pdetail.attributes = row.to_hash.slice(*updatable_attributes)
      # 保存する
      pdetail.save!
    end
  end 

  # 更新を許可するカラムを定義
  def self.updatable_attributes
    ["kubun","naiyo","hyouka","hyokad","plan_id"]
  end

end
